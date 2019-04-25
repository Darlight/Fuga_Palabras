/*
Universidad del Valle de Guatemala
Mario Perdomo Carnet 18029
Josue Sagastume Carnet 18173
Seccion 10 - Org. de computadoras y Assembler
Proposito: Funciones vasicas con lenguaje ARM
*/

.text
.align 2
.global main
.type main,%function

main:


.data
.align 2
formato:
	.asciz "La suma es %d\n"
formato2:
	.asciz "La resta es %d\n"
formato3:
	.asciz "La multiplicacion es %d\n"
formato4:
	.asciz "El AND de ambos registros es %d\n"
formato5:
	.asciz "OR de estos dos registros es  %d\n"
num1:
	.word 8
num2:
	.word 3
	
