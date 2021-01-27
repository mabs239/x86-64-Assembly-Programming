global main						
extern printf
section .data							
	number1	dq	128	; the numbers to be used to 					
	number2	dq	19	; show the arithmetic
	neg_num	dq	-12	; to show sign extension
	fmt		db	"The numbers are %ld and %ld",10,0 					
	fmtint	db	"%s %ld",10,0 
	sumi 	db	"The sum is",0	
	difi	db	"The difference is",0
	inci	db	"Number 1 Incremented:",0
	deci	db	"Number 1 Decremented:",0
	sali	db	"Number 1 Shift left 2 (x4):",0
	sari	db	"Number 1 Shift right 2 (/4):",0
	sariex	db	"Number 1 Shift right 2 (/4) with "
			db	"sign extension:",0
	multi	db	"The product is",0
	divi	db	"The integer quotient is",0
	remi	db	"The modulo is",0 
section .bss
        resulti	resq	1
        modulo 	resq	1
section .text							
	

main:
	push	rbp
	mov 	rbp,rsp
      sub 	rsp,32   		;shadow space
; displaying the numbers
	mov	rcx, fmt
	mov	rdx, [number1]
	mov	r8, [number2]
	call 	printf      
; adding---------------------------------------------------------------------
	mov	rax, [number1]
	add	rax, [number2]		; add number2 to rax
	mov	[resulti], rax		; move sum to result
	; displaying the result
	mov	rcx, fmtint
	mov	rdx, sumi
	mov	r8, [resulti]
	call printf
; substracting---------------------------------------------------------------
	mov	rax, [number1]
	sub	rax, [number2]		; subtract number2 from rax
	mov	[resulti], rax
	; displaying the result
	mov	rcx, fmtint
	mov	rdx, difi
	mov	r8, [resulti]
	call printf
; incrementing----------------------------------------------------------------- 
	mov	rax, [number1]
	inc	rax			; increment rax with 1
	mov	[resulti], rax
	; displaying the result
	mov	rcx, fmtint
	mov	rdx, inci
	mov	r8, [resulti]
	call printf
; decrementing-----------------------------------------------------------------
	mov	rax, [number1]
	dec	rax			; decrement rax with 1
      mov	[resulti], rax
	; displaying the result
	mov	rcx, fmtint
	mov	rdx, deci
	mov	r8, [resulti]
	call printf
; shift arithmetic left------------------------------------------------------
	mov	rax, [number1]
	sal	rax, 2			; multiply rax by 4
	mov	[resulti], rax
	; displaying the result
	mov	rcx, fmtint
	mov	rdx, sali
	mov	r8, [resulti]
	call printf
; shift arithmetic right------------------------------------------------------
	mov	rax, [number1]
	sar	rax, 2			; divide rax by 4
	mov	[resulti], rax
	; displaying the result
	mov	rcx, fmtint
	mov	rdx, sari
	mov	r8, [resulti]
	call 	printf
; shift arithmetic right with sign extension ---------------------------------
	mov	rax, [neg_num]
	sar	rax, 2			; divide rax by 4
	mov	[resulti], rax
	; displaying the result
	mov	rcx, fmtint
	mov	rdx, sariex
	mov	r8, [resulti]
	call 	printf
; multiply-------------------------------------------------------------------
	mov		rax, [number1]
	imul	qword [number2]		; multiply rax with number2
	mov		[resulti], rax
	; displaying the result
	mov	rcx, fmtint
	mov	rdx, multi
	mov	r8, [resulti]
	call printf
; divide---------------------------------------------------------------------
	mov rax, [number1]
 	mov rdx, 0			; rdx needs to be 0 before idiv
	idiv qword [number2]		; divide rax by number2, modulo in rdx
	mov [resulti], rax
  	mov [modulo], rdx	; rdx to modulo
	; displaying the result
      mov rcx, fmtint
	mov	rdx, divi
	mov	r8, [resulti]
      mov	rax, 0
	call printf
	mov	rcx, fmtint
	mov	rdx, remi
	mov	r8, [modulo]
	mov	rax, 0
	call printf  
mov rsp,rbp
pop rbp
ret
		
