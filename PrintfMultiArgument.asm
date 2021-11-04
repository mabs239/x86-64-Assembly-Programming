;All praise be to Almighty Allah 
;and peace and countless blessings
;of Allah be upon our beloved 
;Prophet Muhammad!

;The program demonstrates paremeter passing on stack
extern printf
section .data
    fmt db "%i %i %i %i %i %i %i %i %i %i %i %i %i",10,0
section .bss
section .text
global main
main:
  push   rbp
  mov    rbp,rsp


  mov    rdx,1
  mov    r8,2
  mov    r9,3
  
  mov rax, 13
  push rax  
  mov rax, 12
  push rax 
  mov rax, 11
  push rax 
  mov rax, 10
  push rax
  mov rax, 9
  push rax
  mov rax, 8
  push rax
  mov rax, 7
  push rax
  mov rax, 6
  push rax
  mov rax, 5
  push rax
  mov rax, 4
  push rax
   
  sub rsp, 32
  lea    rcx,[fmt]
  call   printf
  add    rsp,32
    
  mov    rsp,rbp
  pop    rbp
  ret
