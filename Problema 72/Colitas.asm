%include "io.inc"

section .data
    n dw 5
    
section .text
global main

main:
    mov ecx, [n]
    mov eax, 1
    
    factorial:
        imul eax, ecx
        dec ecx
        jnz factorial
    
    PRINT_DEC 4, eax
    
    mov eax, 1
    xor ecx, ecx
    ret
    