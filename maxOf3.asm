
;All praise be to Almighty Allah 
;and countless blessings of Allah
;be upon his beloved Prophet Muhammad
global main
extern printf

section .data
    fmt     db          "Max is: %d",0  
                        ;llu=long-long-unsignd integer (64 bit)
    num1    dq  17
    num2    dq  14
    num3    dq  5                        
section .text

main:
    mov rbp, rsp; for correct debugging
    push rbp
    mov rbp, rsp
    sub rsp, 32
    
    mov rcx, [num1]
    mov rbx, [num2]
    mov rax, [num3]
    
    cmp rcx, rax
    jg label1
    mov rcx, rax
label1:
    cmp rcx, rbx
    jg label2
    mov rcx, rbx
label2:   
    mov rdx, rcx;
    lea rcx, [fmt]
    call printf
    
    leave
    ret  
