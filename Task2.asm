.model small
.stack 100h
.data

msg db 'The sum of the three digit is:$'

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ; Display the original string
               
     lea dx, msg
     
     mov ah, 9
     
     int 21h

     call nextline ; call proc for nextline
     
     call addSum ; call proc for reverse implementation
   
     mov ah, 4ch
     int 21h
main endp

; Procedure to reverse the string
addSum proc
  mov bl, 2  ; First number
    mov dl, 3  ; Second number
    mov cl, 4  ; Third number

    ; Add the first two numbers
    add dl, bl

    ; Add the result to the third number
    add dl, cl

    ; Convert the result to ASCII
    add dl, 48

    ; Print the result
    mov ah, 2
    int 21h
    
    ret

addSum endp

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
