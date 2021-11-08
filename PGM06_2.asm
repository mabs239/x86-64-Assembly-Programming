;All praise be to Almighty Allah 
;and countless blessings of Allah
;be upon his beloved Prophet Muhammad

;Program Listing PGM6_2.ASM
;TITLE FGM6_2: FIRST AND LAST CAPITALS

global main
extern getchar, putchar, printf

section .data	
 PROMPT    DB   'Type a line of text',0
 NOCAP_MSG DB   0DH,0AH,'No capitals ',0
 CAP_MSG   DB   0DH,0AH,'First capital = '
 FIRST     DB   ']'
           DB   0ah,'Last capital = '
 LAST      DB   '@',0

section .text
main:
    push rbp
    mov rbp, rsp; for correct debugging
    sub rsp, 32
 ;display opening message      

          LEA  RCX,[PROMPT]      ;get opening message
          call printf          ;display it

;read and process a line of text
          call getchar           ;read char in AL
WHILE:
;while character is not a carriage return do
          CMP  AL,0aH         ;carriage return?
          JE   END_WHILE      ;yes, exit
; if character is a capital letter
          CMP  AL,'A'         ;char >= 'A'?
          JNGE END_IF         ;not a capital letter
          CMP  AL,'Z'         ;char <= 'Z'?
          JNLE END_IF         ;not a capital letter
;then
;if character precedes first capital
          CMP  AL, [FIRST]       ;char < FIRST?
          JNL CHECK_LAST      ;no, >=
;then first capital = character
          MOV   [FIRST],AL       ;FIRST = char
;end_if  
CHECK_LAST:
;if character follows last capital
          CMP  AL,  [LAST]        ;char > LAST?
          JNG  END_IF         ;no, <=
;then last capital = character
          MOV  [LAST],AL       ;LAST = char
; end_if
END_IF:
;read a character
          call getchar       ;char in AL
          JMP  WHILE         ;repeat loop
END_WHILE:          
;display results
;if no capitals were typed
          CMP  byte [FIRST],"]"     ;FIRST = ']'
          JNE  CAPS          ;no, display results
;then
          LEA  RCX,[NOCAP_MSG]  ;no capitals
          JMP  DISPLAY 
CAPS:
          LEA  RCX,[CAP_MSG]    ;capitals
DISPLAY:
          call printf        ;display message
;end_if
;dos exit
exit:
    leave
    ret
