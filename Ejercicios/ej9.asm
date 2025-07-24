; Ejercicio 9 - Condicional IF 
; Crear un programa en lenguaje ensamblador que:
; Declare dos números en memoria (por ejemplo, 5 y 3).
; Compare ambos números para determinar cuál es mayor.
; Guarde el número mayor en una variable num_mayor.
; Muestre por pantalla el número mayor convertido a carácter ASCII.
; Finalice la ejecución correctamente.

.MODEL small
.STACK 100h
.DATA
    saltoLinea DB 13, 10, '$'
    num1 DB 5
    num2 DB 3
    num_mayor DB 0
.CODE
main PROC
    mov ax, @data
    mov ds, ax

    mov al, num1
    mov bl, num2

    cmp al, bl
    jg mayor_al        ; Si AL > BL, salto a mayor_al

    ; Si BL >= AL
    mov num_mayor, bl
    jmp mostrar

mayor_al:
    mov num_mayor, al

mostrar:
    add num_mayor, 30h     ; Convertir a ASCII
    mov dl, num_mayor
    mov ah, 2
    int 21h

    mov dx, OFFSET saltoLinea
    mov ah, 9
    int 21h

    mov ah, 4Ch
    int 21h
main ENDP
END main
