global main						
extern printf
section .data				
    pi		dq 	3.141592653589793238					
    radius 	dq 	11.0
    fmt 	dq 	"Pi=%.18f  radius=%f  area=%f",10,0 											
section .text									
main:
    push	rbp
    mov 	rbp,rsp
    sub 	rsp,32   		;shadow space
	
    mov 	rcx, fmt					
    movq 	xmm0, [pi]
    movq  	rdx,xmm0
    
    movq 	xmm1, [radius]
    movq  	r8,xmm1	

    movq 	xmm2, [pi]
    mulsd  	xmm2, xmm1; pi*r
    mulsd  	xmm2, xmm1; pi * r^2
    movq  	r9,xmm2	         
    call 	printf

    add rsp, 32			  	
    leave
    ret
