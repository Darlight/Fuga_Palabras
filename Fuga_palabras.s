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









