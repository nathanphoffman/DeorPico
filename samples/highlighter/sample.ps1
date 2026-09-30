# PowerShell sample
<#
  block comment
#>
param(
    [string]$Name = "world",
    [int]$Count = 3
)

function Get-Greeting($who) {
    return "Hello, $who! It's ${env:COMPUTERNAME}"
}

$total = 0
foreach ($i in 1..$Count) {
    if ($i -gt 2 -and $Name -notlike 'w*') {
        $total += $i * 1.5
    } elseif ($i -eq 1) {
        Write-Host (Get-Greeting($Name))
    } else {
        continue
    }
}

try {
    Get-ChildItem -Path 'C:\Temp' | Where-Object { $_.Length -ge 1000 }
} catch {
    throw "failed: $_"
}
