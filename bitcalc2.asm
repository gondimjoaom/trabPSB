%include "asm_io.inc"
; CHECK PRIME
segment .data

num db 00000000b
no1 db		"No 1", 0 ; OK
no0 db		"No 0", 0

segment .bss

	array1 dd 1,2,3,4,5
	array2 dd 6,7,8,9,10

segment .text
        global  asm_main
asm_main:
    
	mov esi, array1
	mov edi , array2
	mov ecx, 5
	rep movsd
		
_end:
        movzx	eax, dx
        call	print_int
        popa
        mov     eax, 0
        leave                     
        ret


