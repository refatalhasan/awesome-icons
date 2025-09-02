section .data
    msg db "Hello, World!", 0Ah

section .text
    global _start

_start:
    ; write(stdout, msg, length)
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 13
    int 0x80

    ; exit(0)
    mov eax, 1
    xor ebx, ebx
    int 0x80
