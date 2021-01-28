global main	
extern printf
section .data	
	  msg1	db	"Aslam O Alaikum!",0	
	  msg2	db	"All praise be to Almighty Allah "
		db	"and peace and countless blessings "
		db	"of Allah be upon our beloved " 
		db	"Prophet Muhammad!",0	
	radius	dd	357	
	pi	dq	3.141592653589793238
	fmtstr	db	"%s",10,0 ;format for printing a string	
	fmtflt	db	"%f",10,0 ;format for a float
	fmtint	db	"%d",10,0 ;format for an integer 
section .bss	
section .text	
main:
    push	rbp
    mov		rbp,rsp
    sub		rsp, 32
    
    mov		rcx, fmtstr	
    mov		rdx, msg1
    call	printf	
    
    mov		rcx, fmtstr
    mov		rdx, msg2
    call	printf	
    
    mov		rcx, fmtint
    mov		rdx, [radius]
    call	printf	
    
    movq	xmm0, [pi]
    movq  	rdx,xmm0
    mov		rcx, fmtflt
    call	printf
    
    mov		rsp,rbp
    pop		rbp
    ret
