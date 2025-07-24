;Ejercicio 3 - Multiplicación de dos números fijos
; Hacer un programa en lenguaje ensamblador que:
; - Multiplique dos números fijos (por ejemplo, 5 y 2).
; - Muestre el resultado en pantalla como un número (en este caso, 10).
; - Finalice la ejecución del programa.

.MODEL small
.STACK 100h
.DATA
.CODE
main PROC

    mov ax, 5
    mov bx, 2
    add ax, bx
    mov cx, 3
    xor dx, dx 

    mol cx  

    mov al, cl        ; DL = carácter a imprimir

    add al, 30h     ; convertir el número en ASCII
    
    mov dl, al        ; DL = carácter a imprimir
    mov ah, 2
    int 21h

    mov ah, 4Ch
    int 21h

main ENDP
END main
