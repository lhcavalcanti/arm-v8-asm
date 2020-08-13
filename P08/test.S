	.globl test
test:
	ADD X19, X0, XZR			// Endereço de Numero
	// Salva Retorno
	ADD X20, X30, XZR

	AND X22, X22, XZR
Loop:
	LDRSB X10, [X19, #0]
	CBZ X10, Exit				// String acabou

	SUB X10, X10, #48 			// "1" - "0" = 1
	MOV X0, X10
	BL fact
	ADD X22, X22, X1			// Add factorial of a char

	ADD X19, X19, #1			// Next char on string
	B Loop
Exit:
	MOV X0, X22
	MOV X30, X20

	BR X30


fact:
	SUB SP, SP, #32
	STUR X30, [SP, #16]		// Return Address on Stack
	STUR X0, [SP, #0]		// Factorial number on Stack
	SUBS X11, X0, #1		// num > 1?
	B.GE L					// if yes, go to Another Factorial Call \/
	LDR X9, =1
	ADD X1, XZR, X9			// if no, start with 1, come back to caller.
	ADD SP, SP, #32
	BR X30
L:
	SUB X0, X0, #1			//num -= 1 (num > 1)
	BL fact					// Factorial again
	LDUR X0, [SP, #0]		// Load number
	LDUR X30, [SP, #16]		// Load return Address
	ADD SP, SP, #32
	MUL X1, X0, X1
	BR X30

	// ---- Function ----

