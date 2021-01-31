;All praise be to Almighty Allah 
;and peace and countless blessings
;of Allah be upon our beloved 
;Prophet Muhammad!

global main	
extern putchar
section .data	
section .bss	
section .text	
main:
    push	rbp
    mov	rbp,rsp
    sub	rsp, 32    
   

    leave
    ret
printReg:    
    push	rbp
    mov		rbp,rsp
    sub		rsp, 32   
    mov r13, 64; loopcount
    mov r12, rcx

TOP:
    RCl r12,1 ;C. F c bit rotated out
    JNC NEXT ;O bit

    mov rcx, '1'
    call putchar
    jmp SKIP
NEXT:
    mov rcx, '0'
    call putchar
SKIP:    
    dec r13
    jnz TOP
    mov rcx, 10; newline
    call putchar
    leave
    ret
    
