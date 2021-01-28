;All praise be to Almighty Allah 
;and countless blessings of Allah
;be upon his beloved Prophet Muhammad

global main
global factorial
extern printf
section .data
    fmt     db          "Factorial is: %llu",0  
                        ;llu=long-long-unsignd integer (64 bit)
section .text
main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32
    
    mov     rcx, 3      ;RCX is input to FACTORIAL function
    call    factorial   ;Returns value in RAX
    lea     rcx, [fmt]  ;"lea rcx, offset fmt" in masm
    mov     rdx, rax    ;RAX is the returned FACTORIAL
    call    printf      ;takes two parameters in rcx and rdx
    leave
    ret

factorial:
    ;input 'n' in rcx
    ;output factorial(n) in rax 
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    cmp     rcx, 1      ; n == 1?
    jnz     recursion   ;If n>1, recursive call
    mov     rax, 1      ;factorial(1) = 1
    jmp     exit
recursion:
    push    rcx         ;save n
    dec     rcx         ;n = n-1
    call    factorial   ;factorial(n-1)
    pop     rcx         ;restore n
    mul     rcx         ;n*factorial(n-1)
exit:
    leave
    ret  
    
