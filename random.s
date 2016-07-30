@Universiadad del Valle de Guatemala
@Laboratorio 1
@Diego Rivera 15085
@28/07/2016
.text
.align 2
.global lfsr

lfsr: 
@@ r0 tiene el primer espacio de memoria 
@@ r1 tiene el tamano del vector
@@ r2 tiene la semilla
@@digamos que polinomio caracteristico es 16, 14,13,11,1
	push {lr}
	Ciclo:
		mov r3,#0b1000000000000000
		and r4, r3, r2
		lsr r4, r4, #15
		mov r3,#0b0010000000000000
		and r5, r3, r2
		lsr r5, r5, #13
		eor r4, r5, r4
		mov r3,#0b0001000000000000
		and r5, r3, r2
		lsr r5, r5, #12
		eor r4, r4, r5
		mov r3,#0b0000010000000000
		and r5, r3, r2
		lsr r5, r5,#10
		eor r4, r4, r5
		lsl r4, r4, #15
		lsr r2, r2,#1
		orr r2, r4, r2

		vcvt.f32.s32 s2, r2

		ldr r6, [r0],#4 
		vmov r6, s2

		cmp r1, #0
		bgt Ciclo

	pop {lr}




