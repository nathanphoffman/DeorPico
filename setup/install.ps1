$ErrorActionPreference = "Stop"

function Require-Command {
    param([string]$Name, [string]$Hint)
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        Write-Error "$Name is required -- $Hint"
        exit 1
    }
}

Require-Command git "install it first: https://git-scm.com/download/win"
Require-Command cargo "install Rust first: https://rustup.rs"

$PicoBinDir = "$env:USERPROFILE\.local\bin"
New-Item -ItemType Directory -Force -Path $PicoBinDir | Out-Null

# deor isn't on the Cargo registry -- it's installed by DeorLang's own
# installer. That script assumes it's running from a real file next to
# out.rs (it does `Split-Path -Parent $MyInvocation.MyCommand.Path`), so it
# can't just be piped through `iex` like this script is. Clone it locally
# and run it as a real file, with the execution policy bypassed for just
# this one process -- no admin rights needed, and nothing persists.
if (-not (Get-Command deor -ErrorAction SilentlyContinue)) {
    Write-Host "Installing deor..."
    $DeorTmp = Join-Path $env:TEMP "deorlang-install-$([guid]::NewGuid())"
    git clone --depth 1 https://github.com/nathanphoffman/DeorLang $DeorTmp
    if ($LASTEXITCODE -ne 0) { throw "git clone of DeorLang failed" }

    powershell -NoProfile -ExecutionPolicy Bypass -File "$DeorTmp\setup\install-deor.ps1"
    if ($LASTEXITCODE -ne 0) { throw "deor install failed" }

    Remove-Item -Recurse -Force $DeorTmp

    # installer only updates the persisted User PATH -- pull it into this
    # process too so the rest of this script can find deor right away
    $env:Path = [Environment]::GetEnvironmentVariable("PATH", "User") + ";" + $env:Path
    Require-Command deor "deor install did not add it to PATH -- restart your terminal and try again"
}

$CloneDir = if ($env:DEOR_PICO_DIR) { $env:DEOR_PICO_DIR } else { "$env:USERPROFILE\.local\share\DeorPico" }
if (Test-Path "$CloneDir\.git") {
    Write-Host "Updating existing DeorPico checkout at $CloneDir..."
    git -C "$CloneDir" pull
    if ($LASTEXITCODE -ne 0) { throw "git pull failed" }
} else {
    Write-Host "Cloning DeorPico into $CloneDir..."
    git clone https://github.com/nathanphoffman/DeorPico $CloneDir
    if ($LASTEXITCODE -ne 0) { throw "git clone of DeorPico failed" }
}

Push-Location $CloneDir
try {
    New-Item -ItemType Directory -Force -Path "build" | Out-Null

    $env:DEOR_LIB = "lib"
    & deor main.deor build\main.rs
    if ($LASTEXITCODE -ne 0) { throw "deor transpile failed" }

    & cargo build --release
    if ($LASTEXITCODE -ne 0) { throw "cargo build failed" }

    Copy-Item "target\release\DeorPico.exe" "$PicoBinDir\dpico.exe" -Force
} finally {
    Pop-Location
}

$userPath = [Environment]::GetEnvironmentVariable("PATH", "User")
if ($userPath -notlike "*$PicoBinDir*") {
    [Environment]::SetEnvironmentVariable("PATH", "$PicoBinDir;$userPath", "User")
    Write-Host "Added $PicoBinDir to your user PATH."
}

Write-Host ""
Write-Host "Installed dpico to $PicoBinDir\dpico.exe"
Write-Host "Restart your terminal, then run 'dpico' to launch it."
