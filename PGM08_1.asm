;The followlng program read a sequence of characters and ·
;display them in reverse order on the next line using stack.
;TITLE   PGM8_1: REVERSE INPUT

global main
extern printf, getchar, putchar
section .data
    msg db "Allah",0
section .text
main:
    mov rbp, rsp; for correct debugging
    push    rbp
    mov     rbp, rsp
    ;display user prompt
            MOV     RCX,"?"          ;char to display
            call putchar             ;display '?'
    ;initialize character count
            XOR     RBX,RBX           ;count = 0
    ;read a character
            call getchar             ;display '?'

    ;while character is not a carriage return do
    WHILE_:
            CMP     AL,0aH          ;CR?
            JE      END_WHILE       ;yes, exit loop
    ;save character on the stack and increment count
            PUSH    RAX              ;push it on stack
            INC     RBX              ;count = count + 1
    ;read a character
            sub rsp, 32              ;Top 4 stack entries will be corrupted by called function
            call getchar             ;display '?'
            add rsp, 32

            JMP     WHILE_          ;loop back
    END_WHILE:
    ;go to a new line

            MOV     RCX,0DH          ;print CR
            sub rsp, 32
            call putchar
            add rsp, 32

            MOV     RCX,0AH          ;print LF
            sub rsp, 32
            call putchar
            add rsp, 32
        
            mov RCX,RBX
            JRCXZ    exit            ;exit if no characters read
    ;for count times do
            
    TOP:
    ;pop a character from the stack
            POP     RCX              ;get a char from stack
    ;display it
            sub rsp, 32
            call putchar
            add rsp, 32
            
            dec RBX
            jnz TOP
            ;LOOP    TOP
    ;end_for
    exit:
        leave
        ret
