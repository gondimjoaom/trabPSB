;PS: o código deve estar dentro da pasta da biblioteca
%include "asm_io.inc"

segment .data
;variaveis inicializadas

msg1 db "digite um numero: ", 0


segment .bss ;variaveis nao inicializadas

var resd 1

segment .text ;codigo do programa
        global  asm_main  ;caso estiver usando windows mudar para _asm_main
        
        
asm_main: ;caso estiver usando windows mudar para _asm_main
        ;imprime uma string
        mov eax, msg1
        call print_string
        
        ;le um inteiro
        call read_int   ;eax = inteiro do teclado
        
        
        ;imprime um inteiro em eax
        call print_int
        
        
        ;imprime uma nova linha
        call print_nl
        
        leave                     
        ret
        
