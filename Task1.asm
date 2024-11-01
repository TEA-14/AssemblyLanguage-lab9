                                                                  .model small
.stack 100h
.data

originalString db 'Today$'

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ; Display the original string
               
     lea dx, originalString
     
     mov ah, 9
     
     int 21h

     call nextline ; call proc for nextline
     
     call reverseString ; call proc for reverse implementation
   
     mov ah, 4ch
     int 21h
main endp

; Procedure to reverse the string
reverseString proc
  mov si, offset originalString
  mov cx, 5
  psh:
    mov bx, [si]
    push bx
    inc si
    loop psh
    
 mov cx, 5

   pp:
   pop dx
   mov ah,2

   int 21h
   loop pp
   
   ret
reverseString endp

;proc for nextline
 nextline proc
    
    mov dx, 10
    mov ah, 2
    int 21h
    
    mov dx, 13
    mov ah,2
    int 21h
        
    ret
    nextline endp  ; end of function

end main
