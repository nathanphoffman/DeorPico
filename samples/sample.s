; x86-64 assembly sample (NASM syntax)
section .data
msg:    db "Hello, world!", 0x0A
len:    equ 14

section .text
global _start

_start:
        mov rax, 1          ; sys_write
        mov rdi, 1          ; stdout
        lea rsi, [msg]
        mov rdx, len
        syscall

        xor ecx, ecx
.loop:
        inc ecx
        cmp ecx, 0FFh
        jne .loop

        mov eax, 60         ; sys_exit
        xor edi, edi
        syscall
