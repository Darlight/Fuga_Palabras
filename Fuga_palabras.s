/*
Universidad del Valle de Guatemala
Mario Perdomo Carnet 18029
Josue Sagastume Carnet 18173
Seccion 10 - Org. de computadoras y Assembler
Proposito: Funciones basicas con lenguaje ARM
*/

.data
.align 2

turno_jugador1:	.asciz "***TURNO JUGADOR 1***\n"
turno_jugador2:	.asciz "***TURNO JUGADOR 2***\n"
formato_palabra:.asciz "Palabra: %s"
ingresar_vocal:	.asciz "Ingrese la vocal:"
formato_vocal:	.asciz " %s"
vocal:			.asciz " "

formato_mal1:	.asciz "ERROR. Puntos Jugador 1: %d\n\n"
formato_mal2:	.asciz "ERROR. Puntos Jugador 2: %d\n\n"
formato_bien1:	.asciz "BIEN. Puntos Jugador 1: %d\n\n"
formato_bien2:	.asciz "BIEN. Puntos Jugador 2: %d\n\n"
mal: 			.asciz "Ingreso incorrecto\n"

ganador1:		.asciz "El Jugador 1 ha ganado"
ganador2:		.asciz "El Jugador 2 ha ganado"
empates:		.asciz "HA SIDO UN EMPATE"
mensaje_final:	.asciz "GRACIAS POR JUGAR\n"

enter:			.asciz "\n"

interfaz_gra1: .asciz "             ,,,,,,,,,,,,:,,,,,,,,,,,:,,,,,,,:,,,,,,,,,:,,,:,,,,,,,,,:,,,,,,,,,,,,,,,,,:,,,,,,,:,,,,,,,:,,,,,,,,,,,,,,,,,,,,,,,:,,,:,,,:,,,,,,,,.,:",  
interfaz_gra2: .asciz "            .,                                                                                                                                    :",   
interfaz_gra3: .asciz "           .:                                                                                                                                    : ",   
interfaz_gra4: .asciz "          .:    .,;;;;                                    5@;              .:;;,            v@7          @8                                     ;  ",   
interfaz_gra5: .asciz "          :     @@@@@@r                                   b@3              @@@@@@Z          E@6          @@                                    :.  ",   
interfaz_gra6: .asciz "         :      @@;     ms   ms   F##CZ7 ;m8@a:       rD8rk@v  ,Xb8i       @@.  @@L 7m@@F.  3@F  Sb@b7   @@rm@t   S7:@m ;X@@X:   v#8D.        :.   ",   
interfaz_gra7: .asciz "        :       8@a;rr  @@  .@@  @@;;@@s kmr;@@;     X@@S6@@r 7@#;;@@      @@:  @@r bE;;@@. s@C ;@i;U@H  @@@U#@@  @@@@b Zkr;@@; @@S:si       ,.    ",   
interfaz_gra8: .asciz "       :        8@@@@@. @@   @@  @@ ,@@   ;7r8@t     @@.  Z@r @@aLL@@Y     @@@@@@L   ;7r@@r s@S  ,rr3@@  @@   @@7 @@r    ;7r8@3 v@@s        .,     ",   
interfaz_gra9: .asciz "      ,.        @@r     @@  ,@@  @HFm7   @@r #@s     @@   b@r @@r.. ,.     @@r     ;@@;.@@r s@C @@F,r@@  @@   @@r @@;  .@@r.6@l   .b@H     .,      ",   
interfaz_gra10: .asciz "     ,.         @@S     @@@8@@@  @@X6Zr  @@7L@@S     Y@@#@@@5 ;@@slZk      @@r     ;@@7L@@T X@P @@kr#@@  @@@b@@@  @@7  .@@iY@@F bE7#@8    .:       ",   
interfaz_gra11: .asciz "    .,          ;C;      rXF ;L T@s  b@D  L63,vr      .Sm7 L;   Y6kEv.     rt;       5ks.L; .5r  rXE;;L  Yr.Cm7   ;S:    sPS.vr :X6a;     :        ",   
interfaz_gra12: .asciz "   .,                           l@@Zk@@7                                                                                                 :         ",   
interfaz_gra13: .asciz "  .:                              :r;:                                                                                                  :          ",   
interfaz_gra14: .asciz "  :                                                                                                                                    :.          ",   
interfaz_gra15: .asciz " ,,..,.,.,.,.,.,.,.,.,.,.,.,.,.,.......,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,,.			"                                                         

arreglo_palabras:	
	.asciz	"n_gro\n","_lote\n","ci_lo\n","pat_s\n","r_ton\n","m_nta\n","b_llo\n","vas_s\n","plat_\n","f_tos\n","rad_o\n","v_nus\n","vig_r\n","h_jas\n","arb_l\n","fr_ta\n","s_lla\n","m_ngo\n","r_loj\n","ment_\n","agu_s\n","fr_sa\n","p_nes\n","hi_lo\n","fu_go\n","pl_za\n","pl_zo\n","p_bre\n","r_yos\n","l_nte\n","pl_no\n","nub_s\n","mis_l\n","g_tas\n","luc_s\n","pi_no\n","cabl_\n","vid_o\n","l_piz\n","c_lor\n"

arreglo_letras:
	.asciz	"e","e","e","o","a","a","e","o","o","o","i","e","o","o","o","u","i","a","e","a","a","e","a","e","e","a","a","o","a","e","a","e","i","o","e","a","e","e","a","a"

	.text
	.align	2
	.global		main
	.type		main,%function


	/*
	R5	Contador de palabras por juego
	R6  Contador de puntos del jugador 1
	R10	Contador de puntos del jugador 2
	R8	Numero random
	R9	letra
	*/

main:
	stmfd	sp!, {lr}
	
	

@Codigo de martha ligia
	ldr r0,=enter
	bl puts

	ldr r0,=interfaz_gra1
	mov r4,r0
	mov r5,#20
fila:	
@Codigo de martha ligia
	bl puts
	add r4,#148
	mov r0,r4
	subs r5,r5,#1
	bne fila

	mov r7,#1
	
	MOV R5, #10
	MOV R6, #0
	MOV R10, #0

	bl palabra1

palabra1:
	MOV R0, #0
	MOV R1, #0
	MOV R4, #0
	MOV R8, #0
	MOV R11, #0
	bl random_real1	

palabra2:
	MOV R0, #0
	MOV R1, #0
	MOV R4, #0
	MOV R8, #0
	MOV R11, #0
	bl random_real2	

turno1:
	SUB R5, R5, #1							@Resta 1 al contador de palabras	

	MOV R11, R0								@Coloca en R11 el numero aleatorio
	MOV R8, R0								@Coloca en R8 el numero aleatorio

	MOV R4, #7
	MUL R8, R8, R4							@Multiplica R4 por el numero aleatorio y lo guarda en R8

	LDR R0, =turno_jugador1
	bl puts

	LDR R0, =formato_palabra				@Coloca en R0 el formato para imprimir la palabra 
	LDR R1, =arreglo_palabras				@Coloca en R1 la direccion del arreglo de palabras
	ADD R1, R1, R8							@Le suma R8 a la direccion
	bl printf								@Imprime la palabra en la direccion designada

	MOV R4, #2
	MUL R11, R11, R4

	LDR R1, =arreglo_letras					@Coloca en R1 la direccion del arreglo de letras
	ADD R1, R1, R11							@Le suma R11 a la direccion del arreglo
	MOV R9, R1								@Coloca en R9 la vocal que falta

	LDR R0, =ingresar_vocal					@Coloca en R0 la direccion del formato para ingresar vocal
	BL puts									@Imprime lo guardado en la direccion

	LDR r0, =formato_vocal					@Coloca en R0 el formato del dato a ingresar
	LDR r1, =vocal							@Coloca en R1 la direccion donde se guardara lo ingresado
	bl scanf								@Lee la vocal ingresada

	@COMPARAR ERROR
	cmp r0,#0								@Compara R0 con 0
	beq Num_Mal1							@Si R0 es igual a 0, salta a Num_Mal1

	LDR R1, =vocal							@Coloca en R1 la direccion de la vocal
	LDRB R9, [R9]
	LDRB R1, [R1]							@Coloca en R1 el valor de la direccion de la vocal 
	CMP R1, R9								@Compara la vocal ingresada con la letra faltante de la Palabra
	BEQ correcto1							@Si son iguales se hace un salto a correcto1
	BNE incorrecto1							@Si no son iguales se hace un salto a incorrecto1

correcto1:
	add R6, R6, #5							@Suma 5 puntos al contador de puntos del jugador 1
	LDR R0, =formato_bien1					@Coloca en R0 el mensaje de ingreso correcto
	MOV R1, R6								@Coloca en R1 el contador del jugador 1
	bl printf								@Imprime en pantalla el mensaje de correcto
	bl palabra2								@Hace un salto al turno del jugador 2

incorrecto1:
	sub R6, R6, #2							@Resta 2 puntos al contador de puntos del jugador 1
	LDR R0, =formato_mal1					@Coloca en R0 el mensaje de ingreso incorrecto
	MOV R1, R6								@Coloca en R1 el contador del jugador 1
	bl printf								@Imprime en pantalla el mensaje de incorrecto
	bl palabra2								@Hace un salto al turno del jugador 2

turno2:
	SUB R5, R5, #1							@Resta 1 al contador de palabras	
	
	MOV R11, R0								@Coloca en R11 el numero aleatorio
	MOV R8, R0								@Coloca en R8 el numero aleatorio

	MOV R4, #7
	MUL R8, R8, R4							@Multiplica R4 por el numero aleatorio y lo guarda en R8

	LDR R0, =turno_jugador2
	bl puts

	LDR R0, =formato_palabra				@Coloca en R0 el formato para imprimir la palabra 
	LDR R1, =arreglo_palabras				@Coloca en R1 la direccion del arreglo de palabras
	ADD R1, R1, R8							@Le suma R8 a la direccion
	bl printf								@Imprime la palabra en la direccion designada

	MOV R4, #2
	MUL R11, R11, R4

	LDR R1, =arreglo_letras					@Coloca en R1 la direccion del arreglo de letras
	ADD R1, R1, R11							@Le suma R11 a la direccion del arreglo
	MOV R9, R1								@Coloca en R9 la vocal que falta

	LDR R0, =ingresar_vocal					@Coloca en R0 la direccion del formato para ingresar vocal
	BL puts									@Imprime lo guardado en la direccion

	LDR r0, =formato_vocal					@Coloca en R0 el formato del dato a ingresar
	LDR r1, =vocal							@Coloca en R1 la direccion donde se guardara lo ingresado
	bl scanf								@Lee la vocal ingresada

	@COMPARAR ERROR
	cmp r0,#0								@Compara R0 con 0
	beq Num_Mal2							@Si R0 es igual a 0, salta a Num_Mal1

	@LDR R9, =arreglo_letras
	@ADD R9, R9, R11

	LDR R1, =vocal							@Coloca en R1 la direccion de la vocal
	LDRB R9, [R9]
	LDRB R1, [R1]							@Coloca en R1 el valor de la direccion de la vocal 
	CMP R1, R9								@Compara la vocal ingresada con la letra faltante de la Palabra
	BEQ correcto2							@Si son iguales se hace un salto a correcto2
	BNE incorrecto2							@Si no son iguales se hace un salto a incorrecto2

correcto2:
	ADD R10, R10, #5							@Suma 5 puntos al contador de puntos del jugador 2
	LDR R0, =formato_bien2					@Coloca en R0 el mensaje de ingreso correcto
	AND R1, #0
	MOV R1, R10								@Coloca en R1 el contador del jugador 2
	bl printf								@Imprime en pantalla el mensaje de correcto
	bl comparar

incorrecto2:
	SUB R10, R10, #2							@Suma 5 puntos al contador de puntos del jugador 2
	LDR R0, =formato_mal2					@Coloca en R0 el mensaje de ingreso correcto
	AND R1, #0
	MOV R1, R10								@Coloca en R1 el contador del jugador 2
	bl printf								@Imprime en pantalla el mensaje de correcto
	bl comparar

comparar:
	CMP R5, #0
	BLE ganador
	BNE palabra1

ganador:
	CMP R6, R10
	BGT gana1
	BLT gana2
	BEQ empate

gana1:
	LDR R0, =ganador1
	bl puts
	bl fin

gana2:
	LDR R0, =ganador2
	bl puts
	bl fin

empate:
	LDR R0, =empates
	bl puts
	bl fin

Num_Mal1:
	ldr r0,=mal
	bl puts
	bl getchar @para que borre la informacion del buffer de teclado
	bl turno1

Num_Mal2:
	ldr r0,=mal
	bl puts
	bl getchar @para que borre la informacion del buffer de teclado
	bl turno2

random_real1:
	bl aleatorios
	cmp r0, #0
	blt random_real1
	cmpge r0, #40
	bgt random_real1
	blt turno1

random_real2:
	bl aleatorios
	cmp r0, #0
	blt random_real2
	cmpge r0, #40
	bgt random_real2
	blt turno2
	
fin:
	LDR R0, =mensaje_final
	bl puts
	
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}
	bx lr


