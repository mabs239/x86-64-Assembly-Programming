;All praise be to Almighty Allah 
;and peace and countless blessings
;of Allah be upon our beloved 
;Prophet Muhammad!

extern printf
section .data
	msgn1	db	"Number 1 is = %d",10,0
	msgn2	db	"Number 2 is = %d",10,0
	msg1	db  	"SHL 2 = OK multiply by 4",0
	msg2	db  	"SHR 2 = wrong divide by 4",0
	msg3	db  	"SAL 2 = correctly multiply by 4",0
	msg4	db  	"SAR 2 = correctly divide by 4",0
	msg5	db	"SHR 2 = OK divide by 4",0
      printmsg	db	10,"%s",10,0 ;format for a string 
      printres	db	"The resulting number is %lld",10,0 ;format for an int 
      printnbr	db	"The original number is %lld",10,0 ;format for an int 
	number1	dq	 8
        number2 dq  	-8
        result 	dq       0
	
section .text							
	global main						
main: 
	push	rbp
	mov 	rbp,rsp 
	sub 	rsp,32

        mov 	rcx, msgn1
        mov 	rdx, [number1]
        call 	printf			;Display first number (+ve)
	mov 	rcx, msgn2
        mov 	rdx, [number2]
        call 	printf			;Display second number (-ve) 
	
;SHL (Shift Left) positive number
        mov 	rdx, msg1
        mov 	rcx, printmsg		;print heading
        call 	printf
        mov 	rdx, [number1]
	mov 	rcx, printnbr		;print number1
        call 	printf
        mov 	rax,[number1]
        shl 	rax,2			;multiply by 4 (logic)
        mov 	rdx, rax
      	mov 	rcx, printres
        call 	printf
;SHL (Shift Left) negative number
        mov     rdx, msg1
        mov 	rcx, printmsg		;print heading
        call 	printf
        mov 	rdx, [number2]
        mov 	rcx, printnbr		;print number2	
        call 	printf
        mov 	rax,[number2]
        shl 	rax,2			;multiply by 4 (logic)
        mov 	rdx, rax
	mov 	rcx, printres        
        call 	printf
;SAL (Shift Arithmatic Left) positive number
        mov     rdx, msg3
        mov 	rcx, printmsg		;print heading
        call 	printf
	mov 	rdx, [number1]
	mov 	rcx, printnbr		;print number1
        call 	printf
        mov 	rax,[number1]
        sal 	rax,2			;multiply by 4 (arithmetic)
        mov 	rdx, rax
	mov 	rcx, printres
        call 	printf
;SAL (Shift Arithmatic Left) negative number
        mov     rdx, msg3
        mov 	rcx, printmsg		;print heading
        call 	printf
        mov 	rdx, [number2]
        mov 	rcx, printnbr		;print number2	
        call 	printf
        mov 	rax,[number2]
        sal 	rax,2			;multiply by 4 (arithmetic)
        mov 	rdx, rax
	mov 	rcx, printres
        call 	printf

;SHR (Shift Right) positive number
        mov     rdx, msg5
        mov 	rcx, printmsg		;print heading	
        call 	printf
        mov 	rdx, [number1]
	mov 	rcx, printnbr		;print number1
        call 	printf
        mov 	rax,[number1]
        shr 	rax,2			;divide by 4 (logic)
        mov 	rdx, rax
	mov 	rcx, printres
        call 	printf
;SHR (Shift Right) negative number
        mov     rdx, msg2
        mov 	rcx, printmsg		;print heading
        call 	printf
        mov 	rdx, [number2]
        mov 	rcx, printnbr		;print number2	
        call 	printf
        mov 	rax,[number2]
        shr 	rax,2			;divide by 4 (logic)
        mov 	[result], rax
        mov 	rdx, rax
	mov 	rcx, printres
        call 	printf

;SAR (Shift Arithmatic Right) positive number
        mov     rdx, msg4
        mov 	rcx, printmsg		;print heading	
        call 	printf
        mov 	rdx, [number1]
	mov 	rcx, printnbr		;print number1
        call 	printf
        mov 	rax,[number1]
        sar 	rax,2			;divide by 4 (arithmetic)
        mov 	rdx, rax
	mov 	rcx, printres
        call 	printf
;SAR (Shift Arithmatic Right) negative number
        mov     rdx, msg4
        mov 	rcx, printmsg		;print heading
        call 	printf
        mov 	rdx, [number2]
        mov 	rcx, printnbr		;print number2	
        call 	printf
        mov 	rax,[number2]
        sar 	rax,2			;divide by 4 (arithmetic)
        mov 	rdx, rax
        mov 	rcx, printres                
        call 	printf
	
	leave
	ret
