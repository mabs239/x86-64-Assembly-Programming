global main
extern printf

segment .data
    fmt db "Number is: %llu",0;  long long unsignd integer
    number dq 0ffffffffffffffffh
segment .text

main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32
    
    lea     rcx, [fmt]; "lea rcx, offset fmt" in masm
    mov     rdx, [number];
    call    printf; takes two parameters in rcx and rdx
    leave
    ret
