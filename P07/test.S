	.globl test
test:
	ADD X19, X0, XZR			// Endereço de C1
	ADD X20, X1, XZR			// Endereço de C2

	// Salva Retorno
	ADD X21, X30, XZR


	BL Pontuacao
	ADD X22, X1, XZR 			// Pontuacao de C1
	ADD X0, X20, XZR 			// Colocando o endereço da C2 em X0
	BL Pontuacao
	ADD X23, X1, XZR 			// Pontuacao de C2

	// Resultado do jogador 1 em X22 e do jogador 2 em X23
	CMP X22, X23
	B.GT J1_A
	B.LT J2_B
	LDR X13, =69
	ADD X5, XZR, X13            // Empate = E
	B Exit
J1_A:
	LDR X13, =65
	ADD X5, XZR, X13		    // Jogador 1 = A
	B Exit
J2_B:
	LDR X13, =66
	ADD X5, XZR, X13			// Jogador 2 = B
	B Exit

	// ---- Function ----
	Pontuacao:
	AND X9, X9, XZR               // i = 0
	AND X1, X1, XZR               // Pontuação = 0
	Loop:
	ADD X10, X0, X9               // addr str[i] em X10
	LDRSB X11, [X10, #0]          // X11 = str[i]
	CBZ X11, End                  // str[i] == 0? final da string
	ADD X9, X9, #1                // i++

	// 1 ponto
	CMP X11, #65                  // X11 == A
	B.EQ Cont1
	CMP X11, #69                  // X11 == E
	B.EQ Cont1
	CMP X11, #73                  // X11 == I
	B.EQ Cont1
	CMP X11, #79                  // X11 == O
	B.EQ Cont1
	CMP X11, #85                  // X11 == U
	B.EQ Cont1
	CMP X11, #78                  // X11 == N
	B.EQ Cont1
	CMP X11, #82                  // X11 == R
	B.EQ Cont1
	CMP X11, #83                  // X11 == S
	B.EQ Cont1

	// 2 pontos
	CMP X11, #68                  // X11 == D
	B.EQ Cont2
	CMP X11, #71                  // X11 == G
	B.EQ Cont2
	CMP X11, #84                  // X11 == T
	B.EQ Cont2

	// 3 pontos
	CMP X11, #66                  // X11 == B
	B.EQ Cont3
	CMP X11, #67                  // X11 == C
	B.EQ Cont3
	CMP X11, #77                  // X11 == M
	B.EQ Cont3
	CMP X11, #80                  // X11 == P
	B.EQ Cont3

	// 4 pontos
	CMP X11, #70                  // X11 == F
	B.EQ Cont4
	CMP X11, #72                  // X11 == H
	B.EQ Cont4
	CMP X11, #86                  // X11 == V
	B.EQ Cont4
	CMP X11, #87                  // X11 == W
	B.EQ Cont4
	CMP X11, #89                  // X11 == Y
	B.EQ Cont4

	// 5 pontos
	CMP X11, #75                  // X11 == K
	B.EQ Cont5

	// 8 pontos
	CMP X11, #74                  // X11 == J
	B.EQ Cont8
	CMP X11, #76                  // X11 == L
	B.EQ Cont8
	CMP X11, #88                  // X11 == X
	B.EQ Cont8

	// 10 pontoS
	CMP X11, #81                  // X11 == Q
	B.EQ Cont10
	CMP X11, #90                  // X11 == Z
	B.EQ Cont10

	B Loop
Cont1:
	ADD X1, X1, #1         // Pont += 1
	B Loop
Cont2:
	ADD X1, X1, #2         // Pont += 2
	B Loop
Cont3:
	ADD X1, X1, #3         // Pont += 3
	B Loop
Cont4:
	ADD X1, X1, #4         // Pont += 4
	B Loop
Cont5:
	ADD X1, X1, #5         // Pont += 5
	B Loop
Cont8:
	ADD X1, X1, #8         // Pont += 8
	B Loop
Cont10:
	ADD X1, X1, #10       // Pont += 10
	B Loop
End:
	BR X30
	// ---- Function ----


Exit:
	ADD X30, X21, XZR
	ADD X0, X5, XZR

	BR X30
