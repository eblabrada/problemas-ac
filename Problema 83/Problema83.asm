%include "io.inc"

section .data
n dd 15
array dw 0, 1, 2, 3, -1, 5, 6, 7, 8, -1, -1, 11, -1, -1, 14
counter dd 0

section .text
global main
main:
    
    push 0 ; Añadimos el parametro a la pila
    
    call dfs
    
    add esp, 4 ;Limpiamos la pila
    
    PRINT_DEC 4, [counter]
    
    xor eax, eax
    ret
    
section .text
dfs:
;--- INICIO PROLOGO ---;
    push ebp
    mov ebp, esp
;--- FIN PROLOGO ------;
    
    mov eax, [ebp + 8] ; Cogemos el parametro de la pila y lo cargamos en EAX
    mov bx, [array + eax * 2] ; Sacamos el valor de ese nodo
    
    sub bx, 0 ; Comparamos el nodo con -1
    
    js .fin ; Retornamos al estado anterior
    
    ;PRINT_STRING "Node index: "
    ;PRINT_DEC 4, eax
    ;NEWLINE
    ;PRINT_STRING "Node value: "
    ;PRINT_DEC 2, bx
    ;NEWLINE
    
    add [counter], byte 1 ; Contamos el nodo
    
    mov ecx, [n] ; Cargamos en ECX la cantidad de nodos
    dec ecx
    
    shl eax, 1 ; Multiplicamos el parametro por 2
    inc eax ; Le sumamos 1
    
    sub ecx, eax ; Le restamos a la cantidad de nodos el indice del hijo izquierdo
    
    js .second ; El nodo esta fuera de rango
        push eax ; Añadimos el parametro a la pila
        call dfs
        add esp, 4 ; Limpiamos la pila

    .second
    mov ecx, [n] ; Cargamos en ECX la cantidad de nodos
    dec ecx
    
    mov eax, [ebp + 8] ; Cogemos el parametro de la pila
    
    shl eax, 1 ; Multiplicamos el parametro por 2
    inc eax ; Le sumamos 1
    inc eax ; Le sumamos 1
  
    sub ecx, eax ; Le restamos a la cantidad de nodos el indice del hijo izquierdo
    
    js .fin ; El nodo esta fuera de rango
        push eax
        call dfs
        add esp, 4

;--- INICIO EPILOGO ---;
    .fin
    pop ebp
    ret
;--- FIN EPILOGO ------;