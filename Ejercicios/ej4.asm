;Ejercicio - Cargar y duplicar un valor usando direccionamiento indirecto en si
; - Declarar un avariable num = 4
; - Cargar ese valor usando direccionamiento indirecto
; - Duplicar ese valor (x2) usando una operacion add
; - Imprimir el resultado en pantalla 

.MODEL small
.STACK 100h
.DATA
    num DB 4      ; Variable con valor 4
.CODE
main PROC
    mov ax, @data
    mov ds, ax

    lea si, num     ; Cargar dirección de num en SI
    mov al, [si]    ; Cargar el valor de num usando direccionamiento indirecto
    add al, al      ; Duplicar el valor (x2)

    add al, 30h     ; Convertir a ASCII
    mov dl, al
    mov ah, 2
    int 21h         ; Mostrar el resultado en pantalla

    mov ah, 4Ch
    int 21h         ; Terminar programa
main ENDP
END main
