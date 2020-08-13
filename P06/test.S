	.globl test
test:
	AND X9, X9, XZR          // X9 = 0
	AND X18, X18, XZR        // X18 = 0
	Loop:
	ADD X20, X0, X9
	LDRSB X10, [X20, #0]    	// X10 = str[X9]
	CBZ X10, End            // string[X9] == #0, fim da string
	ADD X9, X9, #1          // X9++

	CMP X10, #65            // X11 == A ?
	B.EQ Cont
	CMP X10, #69            // X11 == E ?
	B.EQ Cont
	CMP X10, #73            // X11 == I ?
	B.EQ Cont
	CMP X10, #79            // X11 == O ?
	B.EQ Cont
	CMP X10, #85            // X11 == U ?
	B.NE Loop
	Cont:
	ADD X18, X18, #1        // X18 = X18 + 1
	B Loop
	End:
	ADD X0, XZR, X18
	BR X30
