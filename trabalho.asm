%include "asm_io.inc"
segment .data

no0 db		"estou aqui", 0

varM	db 0
varN	db 0
varS	db 0
varT	db 0
varB	db 0
final	db 0
var		db 0
;buracos		db 0
buracos	times 300 db 51

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
	mov		[varN], eax
	add		eax, 1
	mov		[final], eax
	;read M numero de pontes
	call	read_int
	mov		[varM], eax
	
	mov		ecx, eax
	mov		ebx, 0
	
	readVector:
		;add S
		call	read_int
		;call	print_int
		mov		[vect + ebx], eax
		;add T
		add		ebx, 4
		call	read_int
		mov		[vect + ebx], eax
		;add B
		add		ebx, 4
		call	read_int
		mov		[vect + ebx], eax
		
		add 	ebx, 4
		
		loop	readVector
	
	;debug
		mov 	eax, no0
		call	print_string
		call	print_nl
		;mov		eax, 10
	;mov		ebx, 0
	;mov		eax, [vect + ebx]
	;call	print_int
	
	;debug
		mov 	eax, no0
		call	print_string
		call	print_nl
	
	;add		ebx, 1
	mov		eax, 55
	mov		[vect + ebx], eax
	
	mov		ebx, 0
	
	call	func_vet	
	
;algoritmo para coletar menores qtds de buracos	
;MUDEI DE resB para resD então, tenho que mudar todos os índices para
;ficar de 4 em 4 e não de 1 em 1 como estava antes!!!!!
func_vet:
	enter	12, 0
	
	;mov		eax, ebx
	;call	print_int
	
	mov		eax, [vect + ebx] ;fonte
	mov		[ebp-4], eax ;liberando eax
	;call	print_int
	
	add		ebx, 4
	mov		ecx, [vect + ebx] ;destino
	mov		[ebp-8], ecx ;liberando ecx
	
	add		ebx, 4
	mov		edx, [vect + ebx] ;qtd de buracos
	mov		[ebp-12], edx; liberando edx	
	
	;mov		eax, 0;[ebp-4]
	;call	print_int
	
	mov		edx, [buracos + eax] ;pegando qtd de buracos na fonte		
	add		edx, [ebp-12] ;somando qtd de buracos para destino
	
			;debug
		mov 	eax, no0
		call	print_string
		call	print_nl
	
	cmp		[buracos + ecx], edx ;comparando c/ qtd de buracos existente
	
	jg		bigger
	mov		[buracos + ecx], edx ;se for menor, colocar a qtd de buracos nova
	bigger:
	
	add ebx, 4
	mov		eax, 55
	cmp		[buracos + ebx], eax
	jz		finaliza
	call	func_vet
	finaliza:
	leave
	ret
	
sub		ebx, 4
mov		eax,[buracos + ebx]	
call 	print_int

call	print_nl
        popa
        mov     eax, 0
        leave                     
        ret
		
	
		
	
