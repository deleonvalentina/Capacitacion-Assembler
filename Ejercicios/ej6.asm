; Ejercicio 6 - Bucle tipo FOR que imprime un carácter
; Crear un programa en lenguaje ensamblador que:
; Imprima cinco veces el carácter 'A' en pantalla.
; Utilice un bucle tipo FOR, controlado con el registro SI como contador.
; Controle el bucle usando instrucciones de comparación (CMP) y salto condicional (JE o JMP).
; Para imprimir cada carácter, utilice la interrupción INT 21h, función 2.

.MODEL small
.STACK 100h
.DATA
    msg db 'A', 0 
.CODE 
    main PROC
        mov ax, @data  
        mov ds, ax     

        xor si, si 
        for: 
            cmp si, 5d
            je salirFor
            mov al,1
            add al,40h
            mov dl,al
            mov ah,2 
            
            int 21h
            inc si
            jmp for

            salirFor:

        mov ah, 4Ch
        int 21h

    main ENDP
END main
