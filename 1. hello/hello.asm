;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; HELLO WORLD!!!
;
; Q: How do I run this program?
; A: Three steps:
;   1) nasm -f elf hello.asm
;   2) ld -m elf_i386 -s -o hello.x hello.o
;   3) ./hello.x
;
; Q: That's a lot of steps. Can't you make this easier?
; A: Fine, I'll do it for you. Just call "make" in the terminal.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; This is where our constants get declared.
    ; db = "Define Byte"
    ; • Used to initialize sequences of 1-byte sized data
    ; • Each char is 1 byte long, so db lets us define strings!
    ; • See also: dw ("Define Word"), dd ("Define Double-Word")
; Observe:
    ; • 'Hello, World' is 13 chars long
    ; • 0xA is the newline character (aka "\n")
    ; • Total: 14 chars
section .data
    hello db 'Hello, World!', 0xA

; This is where our program logic begins.
; (Here, we simply call the "start" function.)
section .text
    global _start

; This is our start function.
; • In x86, we use four "general registers": eax, ebx, ecx, and edx.
; • We also usee "int 0x80" to make a system call (in other words, begin running our code.)
    ; • "int" means "INTERRUPT", not "integer"! 
    ; • 0x80 basically means "let the kernel run everything up until this point."
    ; Observe that "int 0x80" appears twice: once to write hello, and once to exit.
_start:
    ; First, we set up our registers.
    mov eax, 4          ; 4 = We want to write to a "file descriptor" (some kind of output)
    mov ebx, 1          ; 1 = Our file descriptor is: "stdout" (the terminal)
    mov ecx, hello      ; hello is our pointer to the thing we want to print
    mov edx, 14         ; We want to do this for 14 bytes (chars)! (see .data section)
    ; Now we can begin execution!
    int 0x80

    ; We're done now, so let's make a system call to exit the program.
    ; (We only need eax and ebx for this part.)
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

; Homework:
; 1. Change the number of bytes being printed in line 43.
;    • (What happens when changed to 13? 12? 15?...)
; 2. Modify "_start" to print "Hello, World!" twice!
;    • (Which statements need to be repeated? Which do not?)
; 3. What happens if we remove the system call to exit?
;    • (What error do we get? What do you think this means?)