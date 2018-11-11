%include "asm_io.inc"
; CHECK PRIME
segment .data

num db 00000000b
no1 db		'Z', 0 ; OK
no0 db		"No 0", 0
var db		0

array1 dd 1,2,3,4,5
array2 dd 6,7,8,9,10

segment .bss

a1		resb	10

segment .text
        global  asm_main
asm_main:
		enter   0,0               
        pusha
        call	read_int
        
        mov		[var], eax
        call	read_char
		mov		ecx, 10
		mov		ebx, 0
		mov		eax, 0
		readstring:
			call	read_char
			add		al, [var]
			cmp		al, [no1]
			jg		maiorque1
			back1:
			call	print_char
			mov		[a1 + ebx], al
			add		ebx, 1
			loop	readstring
			
		mov		al, [a1 + 10]
		cmp		al, [no1]
		jg		maiorque2
		back2:
		call	print_char
		jmp		_end
		
maiorque1:
		sub		al, 26
		jmp		back1
maiorque2:
		sub		al, 26
		jmp		back2
		
_end:
		call	print_nl
        popa
        mov     eax, 0
        leave                     
        ret


