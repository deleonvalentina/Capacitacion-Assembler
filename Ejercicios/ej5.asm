; Ejercicio 5 - Intercambio de valores en memoria
; Crear un programa en ensamblador que:
; Guarde los valores 2 y 9 en dos variables en memoria.
; Cargue esos valores usando direccionamiento indirecto.
; Intercambie el contenido de las variables en registros.
; Muestre en pantalla el valor de ambas variables luego del intercambio, uno debajo del otro.

.MODEL small
.STACK 100h 
.DATA
    num1 DB 2            
    num2 DB 9
    saltoLinea db 13, 10, '$' 
.CODE
main PROC
    mov ax, @data        
    mov ds, ax  

    mov al, num1             
    mov bl, num2
    
    lea si, num1
    lea di, num2
    mov bl, [si]   
    mov al ,[di]       

    mov dl, al          
    add dl, '0'           
    mov ah, 2             
    int 21h 

    mov dx , OFFSET saltoLinea 
    mov ah, 9                  
    int 21h  

    mov dl, bl           
    add dl, '0'           
    mov ah, 2             
    int 21h  

    mov ah, 4Ch           
    int 21h                                
main ENDP
END main
