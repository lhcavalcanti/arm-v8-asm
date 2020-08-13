	.globl test
test:
	LDUR X9,[X0, #0]     	// Load a
	LDUR X10,[X1, #0]    	// Load b
	LDUR X11,[X2, #0]   	// Load c
	LDUR X12,[X3, #0]   	// Load x

	AND X12, XZR, XZR    	// x = 0
	CMP X9, XZR            	// a >= 0
	B.LT Exit
	CMP X10, #64           	// b <= 64
	B.GT Exit
	CMP X11, #24           	// c > 24
	B.LE Exit
	LDR X13, =1
	ADD X12, XZR, X13       	// x = 1
	Exit:

	STUR X12, [X3, #0]  // Store x
	BR X30
