%include "io.inc"

section .data
    u dw 2, 0, 1
    v dw 1, -1, 3

section .text
global main

main:
    mov ax, [u+2] ; u_y
    imul ax, [v+4] ; v_z
    mov bx, [u+4] ; u_z
    imul bx, [v+2] ; v_y
    sub ax, bx; u_y * v_z - u_z * v_y
    
    PRINT_CHAR '('
    PRINT_DEC 4, ax
    PRINT_CHAR ','
    
    mov ax, [u+4] ; u_z
    imul ax, [v+0] ; v_x
    mov bx, [u+0] ; u_x
    imul bx, [v+4] ; v_z
    sub ax, bx; u_z * v_x - u_x * v_z
    
    PRINT_DEC 4, ax
    PRINT_CHAR ','
    
    mov ax, [u+0] ; u_x
    imul ax, [v+2] ; v_y
    mov bx, [u+2] ; u_y
    imul bx, [v+0] ; v_x
    sub ax, bx; u_x * v_y - u_y * v_x
    
    PRINT_DEC 4, ax
    PRINT_CHAR ')'
    
    xor eax, eax
    xor ebx, ebx
    ret