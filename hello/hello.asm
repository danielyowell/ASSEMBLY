section .data
    hello db 'Hello, World!', 0xA  ; add newline character

section .text
    global _start

_start:
    ; write the message to stdout
    mov eax, 4          ; syscall: write
    mov ebx, 1          ; file descriptor: stdout
    mov ecx, hello      ; pointer to the message
    mov edx, 14         ; length of the message including the newline character
    int 0x80            ; call kernel

    ; exit the program
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel
