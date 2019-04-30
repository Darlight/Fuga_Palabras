/*
Universidad del Valle de Guatemala
Mario Perdomo Carnet 18029
Josue Sagastume Carnet 18173
Seccion 10 - Org. de computadoras y Assembler
Proposito: Funciones vasicas con lenguaje ARM
*/

.data
.align 2

turno_jugador1:	.asciz "***TURNO JUGADOR 1***\n"
turno_jugador2:	.asciz "***TURNO JUGADOR 2***\n"
formato_palabra:.asciz "Palabra: %s\n"
ingresar_vocal:	.asciz "Ingrese la vocal: \n"
formato_vocal:	.asciz " %s"

formato_mal1:	.asciz "ERROR. Puntos Jugador 1: %d\n"
formato_mal2:	.asciz "ERROR. Puntos Jugador 2: %d\n"
formato_bien1:	.asciz "BIEN. Puntos Jugador 1: %d\n"
formato_bien2:	.asciz "BIEN. Puntos Jugador 2: %d\n"
mal: 			.asciz "Ingreso incorrecto\n"

ganador1:		.asciz "El Jugador 1 ha ganado"
ganador2:		.asciz "El Jugador 2 ha ganado"
empates:		.asciz "HA SIDO UN EMPATE"

vocal:			.asciz " "

/*
interfaz_gra1: 
.asciz 
"             ,,,,,,,,,,,,:,,,,,,,,,,,:,,,,,,,:,,,,,,,,,:,,,:,,,,,,,,,:,,,,,,,,,,,,,,,,,:,,,,,,,:,,,,,,,:,,,,,,,,,,,,,,,,,,,,,,,:,,,:,,,:,,,,,,,,.,:",  
"            .,                                                                                                                                    :",   
"           .:                                                                                                                                    : ",   
"          .:    .,;;;;                                    5@;              .:;;,            v@7          @8                                     ;  ",   
"          :     @@@@@@r                                   b@3              @@@@@@Z          E@6          @@                                    :.  ",   
"         :      @@;     ms   ms   F##CZ7 ;m8@a:       rD8rk@v  ,Xb8i       @@.  @@L 7m@@F.  3@F  Sb@b7   @@rm@t   S7:@m ;X@@X:   v#8D.        :.   ",   
"        :       8@a;rr  @@  .@@  @@;;@@s kmr;@@;     X@@S6@@r 7@#;;@@      @@:  @@r bE;;@@. s@C ;@i;U@H  @@@U#@@  @@@@b Zkr;@@; @@S:si       ,.    ",   
"       :        8@@@@@. @@   @@  @@ ,@@   ;7r8@t     @@.  Z@r @@aLL@@Y     @@@@@@L   ;7r@@r s@S  ,rr3@@  @@   @@7 @@r    ;7r8@3 v@@s        .,     ",   
"      ,.        @@r     @@  ,@@  @HFm7   @@r #@s     @@   b@r @@r.. ,.     @@r     ;@@;.@@r s@C @@F,r@@  @@   @@r @@;  .@@r.6@l   .b@H     .,      ",   
"     ,.         @@S     @@@8@@@  @@X6Zr  @@7L@@S     Y@@#@@@5 ;@@slZk      @@r     ;@@7L@@T X@P @@kr#@@  @@@b@@@  @@7  .@@iY@@F bE7#@8    .:       ",   
"    .,          ;C;      rXF ;L T@s  b@D  L63,vr      .Sm7 L;   Y6kEv.     rt;       5ks.L; .5r  rXE;;L  Yr.Cm7   ;S:    sPS.vr :X6a;     :        ",   
"   .,                           l@@Zk@@7                                                                                                 :         ",   
"  .:                              :r;:                                                                                                  :          ",   
"  :                                                                                                                                    :.          ",   
" ,,..,.,.,.,.,.,.,.,.,.,.,.,.,.,.......,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,,.			",         
                                                                                                                                                      
                                                     

arreglo_palabras:	
	.asciz	"n_gro",		"_lote",		"ci_lo",	"pat_s",	"r_ton",	
			"m_nta",		"b_llo",		"vas_s",	"plat_",	"f_tos",	
			"rad_o",		"v_nus",		"vig_r",	"h_jas",	"arb_l",	
			"fr_ta",		"s_lla",		"m_ngo",	"r_loj",	"ment_",
			"agu_s",		"fr_sa",		"p_nes",	"hi_lo",	"fu_go"
			"pl_za",		"pl_zo",		"p_bre",	"r_yos",	"l_nte",
			"pl_no",		"nub_s",		"mis_l",	"g_tas",	"luc_s",
			"pi_no",		"cabl_",		"vid_o",	"l_piz",	"c_lor"

arreglo_letras:
	.asciz	"e", "e", "e", "o", "a",
			"a", "e", "o", "o", "o",
			"i", "e", "o", "o", "o",
			"u", "i", "a", "e", "a",
			"a", "e", "a", "e", "e",
			"a", "a", "o", "a", "e",
			"a", "e", "i", "o", "e",
			"a", "e", "e", "a", "a"

	.text
	.align	2
	.global		main
	.type		main,%function


	/*
	R5	Contador de palabras por juego
	R6  Contador de puntos del jugador 1
	R7	Contador de puntos del jugador 2
	R8	Numero random
	R9	letra
	R10 palabra random
	*/

main:
	stmfd	sp!, {lr}
	contador_palabras	.req	R5
	contador1			.req	R6
	contador2			.req	R7
	random				.req	R8
	letra				.req	R9
	palabra				.req	R10

	MOV contador_palabras, #10
	MOV contador1, #0
	MOV contador2, #0
/*Codigo de martha ligia*/
	ldr r0,=enter
	bl puts

	ldr r0,=interfaz_gra1
	mov r4,r0
	mov r5,#20
fila:	
/*Codigo de martha ligia*/
	bl puts
	add r4,#148
	mov r0,r4
	subs r5,r5,#1
	bne fila

	mov r7,#1

	bl palabra1


palabra1:
	bl random_real1	

palabra2:
	bl random_real2	

turno1:
	MOV random, R0							@Mueve a la variable random el valor generado aleatorio en R0
	MOV R8, R0 
	MOV R4, #7
	MUL R8, R4

	LDR R0, =formato_palabra				@Coloca en R0 el formato para imprimir la palabra 
	ADD R0, R0, R8
	
	bl printf								@Imprime la palabra

	SUB contador_palabras, contador_palabras, #1		@@Resta 1 al contador de palabras	
	LDR R0, =ingresar_vocal								@Imprime el mensaje para ingresar vocal
	BL puts

	BL getchar						@Borra todo lo que se encuentra en el buffer del teclado
	LDR r0, =formato_vocal			@Coloca en R0 el formato del dato a ingresar
	LDR r1, =vocal					@Coloca en R1 la direccion donde se guardara lo ingresado
	bl scanf						@Lee la vocal ingresada

	@COMPARAR ERROR
	cmp r0,#0
	beq Num_Mal1

	@COMPARAR LETRAS
	LDR R1, =vocal			@Coloca en R1 la direccion de la vocal
	LDR R1, [R1]			@Coloca en R1 el valor de la direccion de la vocal 
	CMP R1, letra			@Compara la vocal ingresada con la letra faltante de la Palabra
	BEQ correcto1			@Si son iguales se hace un salto a correcto1
	BNE incorrecto1			@Si no son iguales se hace un salto a incorrecto1

correcto1:
	add contador1, contador1, #5		@Suma 5 puntos al contador de puntos del jugador 1
	LDR R0, =formato_bien1				@Coloca en R0 el mensaje de ingreso correcto
	MOV R1, contador1					@Coloca en R1 el contador del jugador 1
	bl printf							@Imprime en pantalla el mensaje de correcto
	bl palabra2							@Hace un salto al turno del jugador 2

incorrecto1:
	sub contador1, contador1, #2		@Resta 2 puntos al contador de puntos del jugador 1
	LDR R0, =formato_mal1				@Coloca en R0 el mensaje de ingreso incorrecto
	MOV R1, contador1					@Coloca en R1 el contador del jugador 1
	bl printf							@Imprime en pantalla el mensaje de incorrecto
	bl palabra2							@Hace un salto al turno del jugador 2

turno2:
	MOV random, R0							@Mueve a la variable random el valor generado aleatorio en R0
	MOV R8, R0 
	MOV R4, #7
	MUL R8, R4

	LDR R0, =formato_palabra				@Coloca en R0 el formato para imprimir la palabra 
	ADD R0, R0, R8
	
	bl printf								@Imprime la palabra

	SUB contador_palabras, contador_palabras, #1		@@Resta 1 al contador de palabras	
	LDR R0, =ingresar_vocal								@Imprime el mensaje para ingresar vocal
	BL puts

	BL getchar						@Borra todo lo que se encuentra en el buffer del teclado
	LDR r0, =formato_vocal			@Coloca en R0 el formato del dato a ingresar
	LDR r1, =vocal					@Coloca en R1 la direccion donde se guardara lo ingresado
	bl scanf						@Lee la vocal ingresada

	@COMPARAR ERROR
	cmp r0,#0
	beq Num_Mal2

	@COMPARAR LETRAS
	LDR R1, =vocal			@Coloca en R1 la direccion de la vocal
	LDR R1, [R1]			@Coloca en R1 el valor de la direccion de la vocal 
	CMP R1, letra			@Compara la vocal ingresada con la letra faltante de la Palabra
	BEQ correcto2			@Si son iguales se hace un salto a correcto2
	BNE incorrecto2			@Si no son iguales se hace un salto a incorrecto2

correcto2:
	@Suma 5 puntos al contador de puntos del jugador 2
	add contador2, contador2, #5
	LDR R0, =formato_bien2
	MOV R1, contador2
	bl printf
	bl comparar

incorrecto2:
	@Resta 2 puntos al contador de puntos del jugador 2
	sub contador2, contador2, #2
	LDR R0, =formato_mal2
	MOV R1, contador2
	bl printf
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
	.unreq	contador_palabras
	.unreq	contador1
	.unreq	contador2
	.unreq	random
	.unreq	letra
	.unreq	palabra

	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}
	bx lr


