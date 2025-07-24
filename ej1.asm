;Ejercicio 1 - Suma de dos números fijos
; Hacer un programa en lenguaje ensamblador que:
; - Sume dos números fijos (por ejemplo, 5 y 2).
; - Muestre el resultado en pantalla como un número (en este caso, 7).
; - Finalice la ejecución del programa.
.MODEL small
.STACK 100h
.DATA 

.CODE
main PROC

    mov ax, 5
    mov bx, 2
    add ax, bx 

    add al, 30h
    mov dl, al
    xor ax, ax 
    xor bx, bx
    mov ah, 2
    int 21h 

    mov ah, 4ch
    int 21h

 

 main ENDP

end main
