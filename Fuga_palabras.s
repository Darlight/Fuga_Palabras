/*
Universidad del Valle de Guatemala
Mario Perdomo Carnet 18029
Josue Sagastume Carnet 18173
Seccion 10 - Org. de computadoras y Assembler
Proposito: Funciones vasicas con lenguaje ARM
*/

.data
.align 2

bienvenida:	.asciz "BIENVENIDOS A FUGA DE PALABRAS\n"
turno_jugador1:	.asciz "***TURNO JUGADOR 1***\n"
turno_jugador2:	.asciz "***TURNO JUGADOR 2***\n"
formato_palabra:.asciz "Palabra: %s\n"
formato_vocal:	.asciz "Ingrese la vocal: %s\n"
formato_mal1:	.asciz "ERROR. Puntos Jugador 1: %d\n"
formato_mal2:	.asciz "ERROR. Puntos Jugador 2: %d\n"
formato_bien1:	.asciz "BIEN. Puntos Jugador 1: %d\n"
formato_bien2:	.asciz "BIEN. Puntos Jugador 2: %d\n"

.text
.align 2
.global main
.type main,%function

main:



	
