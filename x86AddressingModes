.model small
.stack 100h
.data
   string db 'abcdefghijklmnopqrstuvwxy%'
.code
   main proc
     mov ax, @data
     mov ds, ax ; register addressing mode

     mov dl, 'A' ; immediate addressing mode
     mov ah, 02
     int 21h
     ;>A

     mov dl, string ;direct addressing mode
     mov ah, 02
     int 21h
     ;>Aa

     mov dl, [string+1] ; direct + offset addressing
     mov ah, 02
     int 21h
     ;>Aab

     ;register indirect addressing
     ; based addressing
     lea bx, string 
     mov dl, [bx] ; bx (ds), bp(ss)
     mov ah, 02
     int 21h
     ;>Aaba

     ;index addressing
     lea si, string 
     mov dl, [si] ; si, di
     mov ah, 02
     int 21h
     ;>Aabaa


     ;register inderect offset addressing
     lea si, string 
     mov dl, [si+2] ; 2+[si] or 2[si]
     mov ah, 02
     int 21h
     ;>Aabaac

     ;register inderect offset addressing
     lea si, string 
     mov dl, 3[si] ; 2+[si] or 2[si]
     mov ah, 02
     int 21h
     ;>Aabaac

     ;Based Indexed Addressing
     lea si, string
     mov bx, 11
     add si, 10
     mov dl, [bx+si]; 

     int 21h
     ;>Aabaacz

     ;Based Indexed Offset Addressing
     lea si, string
     mov bx, 11
     add si, 10
     mov dl, [bx+si+4]; 

     ;Direct Based Indexed Offset Addressing
     mov bx, 11
     mov si, 10
     mov dl, [string+bx+si+4]; 


     int 21h
     ;>Aabaacz

     mov ah, 4ch
     int 21h
   main endp
end main
