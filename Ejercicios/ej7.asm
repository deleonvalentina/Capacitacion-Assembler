;Ejercicio 7 - Ingresar dos digitos y mostrar su suma
;Objetivo: Pida al usuario ingresar dos digitos decimales (0-9)
;Uno por vez, luego calcular la suma de ambos 
;intrucciones:
;- Usar la funcion AH = 01h de INT 21h para leer caracteres del teclado
;- Convertir los caracteres ASCII ingresador a numeros restando'0' (30h)
;- Usar registros como AL, BL y DL para guardar y manipular los valores 
;- Mostrar el resultado con INT 21h, funcion AH = 

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

    ;Mostrar resultado
    add bl,30h
    mov dl, bl           
    mov ah, 02h       
    int 21h 

    mov dx, OFFSET saltoLinea 
    mov ah, 09h          
    int 21h              

    mov ah, 4Ch          
    int 21h              

main ENDP
END main
