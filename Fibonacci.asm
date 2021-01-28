	global main
	extern printf

	section .data
str:	db '%llu   ',10, 0
title:	db 'fibinachi numbers', 10, 0
	
	section .text
main:
    mov rbp, rsp; for correct debugging
       push rbp; set up stack frame
	mov rbp,rsp
	sub rsp,32 ;Win64 functions assume you've allocated 32 bytes 
        
       mov r12, 100 ;Number of terms to print (upto 100)
       mov r13, 0 ;F(n-2)
       mov r14, 1 ;F(n-1)

loop1:
       mov r10, r14 ;Store F(n-1) temporarily
       add r14, r13 ;F(n) = F(n-1)+F(n-2)
       mov r13, r10 ;F(n-2) = F(n-1)

       
       lea rcx, [str]
       mov rdx, r13
       call printf

       dec r12       
       jnz loop1
       
      
       
   	leave
	ret    
