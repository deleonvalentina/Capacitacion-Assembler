; Crear un programa en lenguaje ensamblador que:
; Realice la operación matemática  (5+2)× 3
; Separe el resultado en decenas y unidades.
; Muestre por pantalla cada dígito del resultado de forma individual (en este caso, mostrar “2” y luego “1”).
; Imprima un salto de línea después del resultado.
;Finalice correctamente la ejecución del programa.

.MODEL small
.STACK 100h
.DATA
    saltoLinea DB 13, 10, '$'
.CODE
main PROC
    mov ax, @data
    mov ds, ax

    ; Calcular (5 + 2) * 3 = 21
    mov ax, 5
    mov bx, 2
    add ax, bx        ; AX = 7
    mov cx, 3
    xor dx, dx
    mul cx             ; AX = 21

    ; Preparar impresión del número 21
    mov bx, 10

    div bx            ; AX / 10 → AX = cociente, DX = resto

    mov cl, al        ; CL = cociente = 2
    mov ch, dl        ; CH = resto = 1

    ; Mostrar decenas
    add cl, '0'
    mov dl, cl
    mov ah, 2
    int 21h

    ; Mostrar unidades
    add ch, '0'
    mov dl, ch
    mov ah, 2
    int 21h

    ; Salto de línea
    mov dx, OFFSET saltoLinea
    mov ah, 09h
    int 21h

    ; Salir
    mov ah, 4Ch
    int 21h
main ENDP
END main
