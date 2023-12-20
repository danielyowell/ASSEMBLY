;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; We ran into some interesting quirks last time.
; How can we make our program more efficient?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; bss = "Block Starting Symbol"
; these are static variables (which exist for the entire program)
section .bss

; NEW CONSTANT: helloLen
    ; • equ = "Equate" defines a constant
    ; • $ = current address position
    ; • hello = address of our string
    ; • Thus "$ - hello" subtracts the hello address from our current address,
    ;   giving us the length of the hello string (no matter how long it is)
section .data
    hello: db 'Hello, World! :D', 0xA   ; string to print
    helloLen: equ $ - hello               ; length of string

section .text
    global _start

; program start
_start:
    ; write the message to stdout
    mov eax, 4          ; syscall: write
    mov ebx, 1          ; file descriptor: stdout
    mov ecx, hello      ; pointer to string
    mov edx, helloLen   ; length of string + newline char
    int 0x80            ; call kernel

    ; exit program
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

;;;;;;;;;;;;;;;;

; Q: Hey, isn't "equ" doing basically the same thing as "db"? What's the difference?
; A: Good question! To put it simply:
    ; • "equ" isn't allocating any space in memory. 
    ;   It just says to replace all instances of helloLen with the designated value during runtime.
    ; • "db" DOES allocate space in memory!
    ;   It places a sequence of bytes in memory and assigns "hello" as a ptr to the address.
    ; • For more info: https://itecnote.com/tecnote/whats-the-difference-between-equ-and-db-in-nasm/