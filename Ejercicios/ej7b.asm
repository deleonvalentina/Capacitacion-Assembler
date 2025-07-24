;Parte 2 - La suma tiene que dar un numero de dos digitos

.MODEL small
.STACK 100h
.DATA
    resultado DB 0      
    saltoLinea DB 13, 10, '$' 
  
.CODE 
main PROC
    mov ax, @data
    mov ds, ax
    
    ;Leer primer digito
    mov ah, 1          
    int 21h              
    sub al, 30h          
    mov bl, al  
    
    lea dx, saltoLinea
    mov ah,09
    int 21h
    
             
    ;Leer segundo digito
    mov ah, 1         
    int 21h              
    sub al, 30h
    add bl, al          
     
    
    lea dx, saltoLinea
    mov ah,09
    int 21h  

    mov al, bl      ; tiene que estar si o si al 
    aam             ; discrimina unidades y decenas al registro al, las unidades en ah y las decenas en al

    
    add ah, 30h
    mov dl, ah
    mov ah, 02h
    mov bh, al
    int 21h

    mov al, bh
    
    add al, 30h 
    mov dl, al
    mov ah, 02h
    int 21h
          

    mov ah, 4Ch          
    int 21h              

main ENDP
END main
