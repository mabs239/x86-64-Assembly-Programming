;All praise be to Almighty Allah 
;and peace and countless blessings
;of Allah be upon our beloved 
;Prophet Muhammad!


extern printf
section .data
		
      		pi  dq 3.14159			
	singlePrecisionVector1  dd      1.1
                 dd      2.2
                 dd  	3.3
                 dd  	4.4
	singlePrecisionVector2   dd      1.2
                 dd      2.3
                 dd 	3.4
                 dd  	4.5
;double precision                 
	DoublePrecisionVector1   dq      1.1
                 dq      2.2
	DoublePrecisionVector2   dq 	3.3
                 dq   	4.4
        
	fmt1 db "Single Precision Vector 1: %f, %f, %f, %f",10,0
	fmt2 db "Single Precision Vector 2: %f, %f, %f, %f",10,0
	fmt3 db "Sum of Single Precision Vector 1 and Vector 2: %f, %f, %f, %f",10,0
	fmt4 db "Double Precision Vector 1: %f, %f",10,0
	fmt5 db "Double Precision Vector 2: %f, %f",10,0
	fmt6 db "Sum of Double Precision Vector 1 and Vector 2: %f, %f",10,0        

section .bss
	singlePrecisionVector_res resd 4
	DoublePrecisionVector_res resq 4
section .text							
	global main					
main:
push	rbp		
mov	rbp,rsp


    	 mov 	rcx,fmt1
        mov	rsi,singlePrecisionVector1
        call printSinglePrecisionVector 
        
  
       mov 	rcx,fmt2
        mov	rsi,singlePrecisionVector2
        call printSinglePrecisionVector 
        
        ; add 2 single precision floating point vectors
  	movups	xmm0, [singlePrecisionVector1]          
    	movups 	xmm1, [singlePrecisionVector2]            
    	addps 	xmm0,xmm1 
        ;print result
    	movups 	[singlePrecisionVector_res], xmm0
    	mov 		rsi,singlePrecisionVector_res
    	mov 		rcx,fmt3
    	call 	printSinglePrecisionVector 


; add 2 double precision floating point vectors
    	mov	rsi,DoublePrecisionVector1
    	mov 	rcx,fmt4
    	call printDoublePrecisionVector 
    
    	mov 	rsi,DoublePrecisionVector2
    	mov 	rcx,fmt5
    	call printDoublePrecisionVector 
        
    	movupd 	xmm0, [DoublePrecisionVector1]          
    	movupd 	xmm1, [DoublePrecisionVector2]            
    	addpd 	xmm0,xmm1 
    	movupd 	[DoublePrecisionVector_res], xmm0
    	mov 		rsi,DoublePrecisionVector_res
    	mov 		rcx,fmt6
    	call 	printDoublePrecisionVector
    
leave	
ret

printSinglePrecisionVector:    
push rbp
mov 	rbp,rsp

    	;rcx = format string
        ;rsi =  vector address
    	movss 	xmm0, [rsi]
	cvtss2sd 	xmm0,xmm0
       movq rdx, xmm0;;;

	movss 	xmm1, [rsi+4]
	cvtss2sd 	xmm1,xmm1
       movq r8, xmm1;;;

	movss 	xmm2, [rsi+8]
	cvtss2sd 	xmm2,xmm2
       movq r9, xmm2;;;

	movss 	xmm3, [rsi+12]
	cvtss2sd 	xmm3,xmm3
        
       movq r10, xmm3
       push r10 ;xmm3 can not be pushed directly on stack
        
       ;push qword[pi];;;

	
       sub rsp,32	;must be placed here
	call printf
	add rsp,32
leave
ret

printDoublePrecisionVector:    
push rbp
mov rbp,rsp
    	movsd 	xmm0, [rsi]
        movq rdx, xmm0
	movsd 	xmm1, [rsi+8]
        movq r8, xmm1
        
	sub rsp,32	;must be placed here
	call printf
	add rsp,32
leave
ret
