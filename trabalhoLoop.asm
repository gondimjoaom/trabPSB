%include "asm_io.inc"
segment .data

no0 db		"estou aqui", 0

varM	db 0
varN	db 0
varS	db 0
varT	db 0
varB	db 0
final	db 0
fonte		db 0
destino		db 0
buraco		db 0
buracos	times 300 db 55 ;os índices desse vetor são os pilares

segment .bss

vect	resd 300

segment .text
		global asm_main
		
asm_main:

	enter 0,0
	pusha
	mov		eax, 0
	mov		[buracos + 0], eax
	;read N numero de pilares
	call	read_int
	;mov		[varN], eax ;não estou usando isso para nada!! pode ficar no vetor de buracos/pilares
	add		eax, 1
	push	eax
	;mov		[final], eax
	;read M numero de pontes
	call	read_int
	push 	eax
	;mov		[varM], eax
	
	mov		ecx, eax
	mov		ebx, 0
	
	readVector:
		;add S fonte
		call	read_int
		;call	print_int
		mov		[vect + ebx], eax
		;add T destino
		add		ebx, 4
		call	read_int
		mov		[vect + ebx], eax
		;add B buracos
		add		ebx, 4
		call	read_int
		mov		[vect + ebx], eax
		
		add 	ebx, 4
		
		loop	readVector
	;ebx está saindo do loop em uma posição a mais no vetor
	;add		ebx, 1
	;mov		eax, ebx
	;call	print_int
	;call	print_nl
	;mov		eax, 55
	;mov		[vect + ebx], eax
	
	mov		ebx, 0
	pop		ecx
	;call	print_int
	;mov		ecx, eax
	;mov		ecx, [varM]
	
	logica:
	
		mov		eax, [vect + ebx*4] ;fonte
		;mov		[fonte], eax
		push	ecx
		mov		ecx, [buracos + eax*4] ;ecx tem quantos buracos precisou para chegar na fonte
		
		add 	ebx, 1
		mov		eax, [vect + ebx*4] ;destino
		push	eax
		;mov		[destino], eax
		mov		edx, [buracos + eax*4] ;edx tem quantos buracos precisa passar para chegar no destino
		
		add		ebx, 1
		mov		eax, [vect + ebx*4] ;buracos
		
		add		eax, ecx ;buracos na aresta + buracos na fonte
		
		cmp		eax, edx
		jge		mantem
		pop		edx
		mov		[buracos + edx*4], eax
		jmp		noPop	
		
		;debug
		;call	print_int
		;mov 	eax, no0
		;call	print_string
		;call	print_nl
		
		mantem:
		;add		ebx, 1
		pop		ecx
		noPop:
		add		ebx, 1
		pop		ecx
		;mov		eax, ecx
		;call	print_int
		loop	logica
		
		;mov		eax, [buracos + 8]
		pop 	ebx
		mov		eax, [buracos + ebx*4]
		call	print_int
		
call	print_nl
        popa
        mov     eax, 0
        leave                     
        ret
		
	
		
	
