; Ejercicio 11 - Integrador 
; Crear un programa en lenguaje ensamblador que:
; Declare dos valores numéricos en registros (AL y BL) con los valores 2 y 9 respectivamente.
; Intercambie los valores almacenados en AL y BL utilizando la instrucción XCHG.
; Muestre en pantalla primero el valor que quedó en AL (después del intercambio) convertido a carácter ASCII.
; Imprima un salto de línea para separar las salidas.
; Luego, muestre el valor que quedó en BL (después del intercambio) convertido a carácter ASCII.
; Finalice la ejecución del programa correctamente.

.MODEL small
.STACK 100h

.DATA
SaltoLinea db 13, 10, '$'

.CODE
main PROC

    mov ax, @data
    mov ds, ax

    mov al, 2
    mov bl, 9

    xchg al, bl           ; Intercambia AL y BL

    mov dl, al
    add dl, '0'
    mov ah, 2
    int 21h               ; Imprime AL

    mov dx , OFFSET SaltoLinea
    mov ah, 9
    int 21h               ; Imprime salto de línea

    mov dl, bl
    add dl, '0'
    mov ah, 2
    int 21h               ; Imprime BL

    mov ah, 4Ch
    int 21h               ; Finaliza el programa

main ENDP
END main
