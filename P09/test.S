	.globl test
test:
	ADD X19, X0, XZR				// Endereço de String
	ADD X20, X1, XZR				// Endereço de Palavra
	ADD X21, X30, XZR				// Salva Retorno

	LDR X5, =0x7fffffffffffffff
	LDR X22, =0x0
Loop:
	ADD X15, X20, X22
	LDRSB X10, [X15, #0]			// Letra da palavra str[i]
	CBZ X10, Exit					// String acabou str[i] =='\0'
	ADD X22, X22, #1				// i++
	MOV X0, X10
	BL Count
	CMP X5, X0						// minimo de repetições da letra,
	B.LT Loop						//  é pra atualizar?
	MOV X5, X0
	B Loop
Exit:
	MOV X0, X5
	LDR X13, =0x7fffffffffffffff
	CMP X5, X13					// Achou alguma ocorrência?
	B.NE Occurrence
	MOV X0, XZR
Occurrence:
	MOV X30, X21
	BR X30





Count:
	MOV X10, X19
	MOV X12, XZR
CountLoop:
	LDRSB X11, [X10, #0]		// str[X10]
	CBZ X11, EndFunction		// String acabou ?
	ADD X10, X10, #1			// X10++
	CMP X0, X11					// Letras inguais?
	B.NE CountLoop
	ADD X12, X12, #1
	B CountLoop
EndFunction:
	MOV X0, X12
	BR X30


