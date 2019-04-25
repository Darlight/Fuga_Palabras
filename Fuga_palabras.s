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
formato_vocal:	.asciz "Ingrese la vocal: \n"
formato_mal1:	.asciz "ERROR. Puntos Jugador 1: %d\n"
formato_mal2:	.asciz "ERROR. Puntos Jugador 2: %d\n"
formato_bien1:	.asciz "BIEN. Puntos Jugador 1: %d\n"
formato_bien2:	.asciz "BIEN. Puntos Jugador 2: %d\n"
ganador1:	.asciz "El Jugador 1 ha ganado"
ganador2:	.asciz "El Jugador 2 ha ganado"
empates:	.asciz "HA SIDO UN EMPATE"

pal1:	
	.asciz "p","a","c","t","o","_"
pal2:
	.asciz "c","a","l","l","e","_"
pal3:
	.asciz "r","a","d","i","o","_"
pal4:
	.asciz "t","r","e","c","e","_"
pal5:
	.asciz "d","a","m","a","s","_"
pal6:
	.asciz "q","u","e","j","a","_"
pal7:
	.asciz "p","e","c","a","s","_"
pal8:
	.asciz "m","a","c","h","o","_"
pal9:
	.asciz "r","a","b","i","a","_"
pal10:
	.asciz "j","a","d","e","o","_"
pal11:
	.asciz "m","a","d","r","e","_"
pal12:
	.asciz "i","d","o","l","o","_"
pal13:
	.asciz "f","a","c","h","a","_"
pal14:
	.asciz "b","a","h","i","a","_"
pal15:
	.asciz "d","a","n","g","o","_"
pal16:
	.asciz "j","a","b","o","n","_"
pal17:
	.asciz "j","o","r","g","e","_"
pal18:
	.asciz "v","a","g","o","s","_"
pal19:
	.asciz "a","b","e","j","a","_"
pal20:
	.asciz "q","u","e","s","o","_"

.text
.align 2
.global main
.type main,%function

main:

turno1:
	SUB contador_palabras, contador_palabras, #1
	LDR R0, =formato_vocal
	BL puts

	BL getchar
	LDR r1,=formato_vocal
	STR r0,[r1]

	@Compara la letra ingresada con la letra faltante
	CMP R0, letra
	BEQ correcto1

correcto1:
	@Suma 5 puntos al contador de puntos del jugador 1
	add contador1, contador1, #5
	bl turno2

incorrecto1:
	@Resta 2 puntos al contador de puntos del jugador 1
	sub contador1, contador1, #2
	bl turno2

turno2:
	SUB contador_palabras, contador_palabras, #1

	LDR R0, =formato_vocal
	BL puts

	BL getchar
	LDR r1,=formato_vocal
	STR r0,[r1]

	@Compara la letra ingresada con la letra faltante
	CMP R0, letra
	BEQ correcto2

correcto2:
	@Suma 5 puntos al contador de puntos del jugador 2
	add contador2, contador2, #5
	bl comparar

incorrecto2:
	@Resta 2 puntos al contador de puntos del jugador 2
	sub contador2, contador2, #2
	bl comparar

comparar:
	CMP contador_palabras, #0
	BEQ fin
	BNE turno1

ganador:
	CMP contador1, contador2
	BGT gana1
	BLT gana2
	BEQ empate

gana1:
	LDR R0, =ganador1
	LDR R0, [R0]
	bl puts
	bl fin

gana2:
	LDR R0, =ganador2
	LDR R0, [R0]
	bl puts
	bl fin

empate:
	LDR R0, =empates
	LDR R0, [R0]
	bl puts
	bl fin

fin:
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}
	bx lr