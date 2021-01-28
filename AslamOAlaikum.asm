;All praise be to Almighty Allah 
;and peace and countless blessings
;of Allah be upon our beloved 
;Prophet Muhammad!

global main	
extern printf
section .data	
	  msg1	db	"Aslam O Alaikum!",0	
section .bss	
section .text	
main:
    push	rbp
    mov		rbp,rsp
    sub		rsp, 32    
    mov		rcx, msg1
    call	printf	
    mov		rsp,rbp
    pop		rbp
    ret
