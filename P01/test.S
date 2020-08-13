	.globl test
test:
	LDUR X9,[X0,#0]       // Load a
	LDUR X10,[X1,#0]      // Load b
	LDUR X11,[X2,#0]      // Load m
	CMP X10, X11           // b == m
	B.NE Else
	SUB X11, X10, X9       // m = b - a
	B Exit
	Else: SUB X11, X9, X10 // m = a - b
	Exit:
	STUR X9, [X0, #0]		// Store a
	STUR X10, [X1, #0]		// Store b
	STUR X11, [X2, #0]		// Store m
	BR	X30
