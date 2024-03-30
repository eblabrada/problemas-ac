%include "io.inc"

section .data
na dd 10
array dw 1,2,3,4,5,6,7,8,9,10
n dd 10
counter dd 0

section .text
global main
main:

    ;IMPRIMIR LOS DIVISORES
    
    mov ecx, [na] ; Cargamos el tamaño del array en ECX
   
    .loop:
        mov eax, [n] ; Cargamos el dividendo en EAX
       
        mov edx, [counter] ; Cargamos el contador en EDX
    
        movzx ebx, word[array + edx] ; Cargamos el elemento del array en EBX
    
        xor edx, edx ; Limpiamos EDX para evitar interferencias           

        div ebx ; Dividir EAX por EBX, resultado en EAX, resto en EDX
        
        cmp edx, 0
        
        jne .not_divide
            PRINT_DEC 4, ebx
            NEWLINE
        
        .not_divide:
        
        add [counter], byte 2
        dec ecx
        jnz .loop
    
    NEWLINE
     
    ;IMPRIMIR LOS NO DIVISORES
                
    mov ecx, [na] ; Cargamos el tamaño del array en ECX
    mov [counter], byte 0
    
    .loop2:
        mov eax, [n] ; Cargamos el dividendo en EAX
       
        mov edx, [counter] ; Cargamos el contador en EDX
    
        movzx ebx, word[array + edx] ; Cargamos el elemento del array en EBX
    
        xor edx, edx ; Limpiamos EDX para evitar interferencias           

        div ebx ; Dividir N por el elemento del array (EAX / EBX), resultado en EAX, resto en EDX
        
        cmp edx, 0
        
        
        je .divide
            PRINT_DEC 4, ebx
            NEWLINE
        .divide:
        
        add [counter], byte 2
        dec ecx
        jnz .loop2
       
    xor eax, eax
    ret