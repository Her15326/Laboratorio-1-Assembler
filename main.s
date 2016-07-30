@Universiadad del Valle de Guatemala
@Laboratorio 1
@Diego Rivera 15085
@28/07/2016
.text
.align 2
.global main
.type main, %function

main:
	stmfd sp!, {lr} /* SP = R13 link register */
	
	ldr r0,=vector
	mov r1, #5
	mov r2, #0b0010010101101010
	bl lfsr

	ldr r0,=vector
	IMPRE:
		LDR r0, =fimp
		@ Se carga el valor del arreglo al Registro R1
		LDR r1, [r0], #4
		@ Se imprime
		bl printf
		@ Se resta al contador y compara si es 0
		SUB r8, r8, #1
		CMP r8, #0
		@ Si no es igual a 0, imprime el siguiente elemento
		BNE IMPRE


exit:
	@@ Salida correcta
	mov r0,#0
	mov r3,#0
	ldmfd sp!, {lr}
	bx lr
	
	

.data
.align 2
.global vector
.global solic
.global formato
.global numero
vector:
		.space 5
solic:
		.asciz "Ingrese un numero:"
formato:
		.asciz "%d"
numero:
		.word 0
mensaje:
		.asciz "\nEl valor minimo es: %d\n"

MBienvenida: .asciz  "Bienvenido, Por favor ingrese 10 numeros\n"

fimp:		.asciz "%d\n"
