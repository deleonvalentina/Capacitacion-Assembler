; Ejercicio 10 
; Crear un programa que compare dos números ingresados por el usuario
; y muestre en pantalla cuál es el mayor
; Instrucciones:
; - Leer dos números decimales (0-9) desde teclado, uno por vez
; - Convertir los caracteres ASCII a valores numéricos
; - Comparar ambos números y determinar cuál es mayor
; - Mostrar en pantalla el mensaje "mayor: " seguido del número mayor
; - Finalizar correctamente la ejecución

.MODEL small
.STACK 100h

.DATA
    saltoLinea DB 13, 10, '$'       ; salto de línea para salida
    num_mayor  DB 0                 ; variable para guardar el número mayor
    mensaje DB 'mayor: $'           ; mensaje a mostrar antes del número

.CODE
main PROC
    ; Inicializar segmento de datos
    mov ax, @data
    mov ds, ax

    ; Leer primer número (carácter ASCII)
    mov ah, 1            ; función 1 de int 21h: leer carácter
    int 21h              ; espera ingreso
    sub al, 30h          ; convierte de ASCII a número
    mov bl, al           ; guarda el número en BL

    ; Leer segundo número
    mov ah, 1
    int 21h
    sub al, 30h          ; convierte de ASCII a número

    ; Comparar segundo número (AL) con el primero (BL)
    cmp al, bl
    jl L2                ; si AL < BL, salta a L2 (BL es mayor)

    ; Si AL >= BL, AL es el mayor
    mov num_mayor, al
    jmp mostrar

L2:
    ; BL es mayor
    mov num_mayor, bl

mostrar:
    ; Mostrar mensaje
    mov dx, OFFSET mensaje
    mov ah, 09h
    int 21h

    ; Mostrar número mayor
    mov al, num_mayor
    add al, 30h          ; convierte a ASCII
    mov dl, al
    mov ah, 02h          ; función para mostrar un carácter
    int 21h

    ; Salto de línea
    mov dx, OFFSET saltoLinea
    mov ah, 09h
    int 21h

    ; Finalizar el programa
    mov ah, 4Ch
    int 21h
main ENDP
END main
