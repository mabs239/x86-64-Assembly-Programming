global main
global factorial
extern printf
segment .data
    fmt db "Factorial is: %llu",0;  long long unsignd integer
segment .text
main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32
    mov     rcx, 20; Place the number in RCX
    call    factorial; Returns value in RAX
    lea     rcx, [fmt]; "lea rcx, offset fmt" in masm
    mov     rdx, rax; as returned from factorial
    call    printf; takes two parameters in rcx and rdx
    leave
    ret

factorial:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    mov     rax, 1
label1:
    mul rcx; rax = rcx * rax
    loop label1
    leave
    ret    
    
; nasm -f win64 -g Factorial.asm -l Factorial.lst
; gcc -o Factorial.exe Factorial.obj
; Factorial.exe
; Factorial is: 2432902008176640000
