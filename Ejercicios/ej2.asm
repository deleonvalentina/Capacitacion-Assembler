;Ejercicio 2 - Resta de dos números fijos
; Hacer un programa en lenguaje ensamblador que:
; - Reste dos números fijos (por ejemplo, 7 y 3).
; - Muestre el resultado en pantalla como un número (en este caso, 4).
; - Finalice la ejecución del programa.

.MODEL small
.STACK 100h
.DATA 
.CODE
main PROC
    
    mov cx, 7
    mov dx, 3
    sub cx, dx 
       
    add cl, 30h
    mov dl, cl
    mov ah, 2
    int 21h 
    
    mov ah, 4ch
    int 21h
    
 main ENDP   
end main
