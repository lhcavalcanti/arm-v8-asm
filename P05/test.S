	.globl test
test:
	LDUR X12, [X0, #0] 			// X10
	Loop:
	CMP X12, XZR       // if(X12 > 0)
	B.LE Exit
	SUB X12, X12, #1   // X12 -= 1
	B Loop             // Go to Loop
	Exit:
	STUR X12, [X0, #0]
	BR X30
