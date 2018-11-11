%include "asm_io.inc"
; CHECK PRIME
segment .data

num db 00000000b
no1 db		"No 1", 0 ; OK
space db	" ", 0
var	dd		0


segment .bss

a1		resd 10 ;define o vetor com 10 espaços não inicializados w -> words

segment .text
        global  asm_main
asm_main:
        enter   0,0               
        pusha

		mov		ecx, 10
		mov		ebx, 0
		jmp 	_lp

		_lp:
		call	read_int
		mov		[a1 + ebx], eax
		;mov		eax, [a1 + ebx]
		;call	print_int
		add		ebx, 4
		loop	_lp
		
		
		;call	read_int
		mov		ecx, 10
		mov		ebx, 0
		
		;jmp		_lp2
		
		_lp2:
			call	read_int ; inteiro em eax
			mov		edx, ecx
			mov		ecx,10
			mov		[var], ebx
			mov		ebx, 0
			compare:
					cmp		eax, [a1 + ebx]
					jz		printnumber
					add		ebx, 4
					loop	compare
			
			mov		ebx,[var]
			add		ebx, 4
			mov		ecx, edx
			loop	_lp2
			
		jmp		_end
		
printnumber:
			mov		eax, [a1 + ebx]
			;call	print_string
			call	print_int
			mov		eax, space
			call	print_string
			mov		eax, [a1 + ebx]
			
			add		ebx, 4
			jmp		compare
		
_end:
        call	print_nl
        popa
        mov     eax, 0
        leave                     
        ret


