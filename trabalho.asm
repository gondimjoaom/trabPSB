%include "asm_io.inc"
segment .data

varM	db 0
varN	db 0
varS	db 0
varT	db 0
varB	db 0
final	db 0
buracos		db 0

segment .bss

vectPath	resw 300

segment .text
		global asm_main
		
asm_main:

	enter 0,0
	pusha
	;read N
	call	read_int
	mov		[varN], eax
	add		eax,1
	mov		[final], eax
	;read M
	call	read_int
	mov		[varM], eax
	
	mov		ecx, [varM]
	mov		ebx, 0
	
	readVector:
		;add S
		call	read_int
		mov		[vect + ebx], eax
		;add T
		add		ebx, 2
		call	read_int
		mov		[vect + ebx], eax
		;add B
		add		ebx, 2
		call	read_int
		mov		[vect + ebx], eax
		loop	readVector
		
	mov		ebx, 0
		
	
		
	
