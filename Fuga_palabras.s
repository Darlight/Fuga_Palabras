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
"              ,,,,,,,,,,,,:,,,,,,,,,,,:,,,,,,,:,,,,,,,,,:,,,:,,,,,,,,,:,,,,,,,,,,,,,,,,,:,,,,,,,:,,,,,,,:,,,,,,,,,,,,,,,,,,,,,,,:,,,:,,,:,,,,,,,,.,:  
                                                                                                                                                   .  
            .,                                                                                                                                    :   
           .:                                                                                                                                    :    
          .:    .,;;;;                                    5@;              .:;;,            v@7          @8                                     ;     
          :     @@@@@@r                                   b@3              @@@@@@Z          E@6          @@                                    :.     
         :      @@;     ms   ms   F##CZ7 ;m8@a:       rD8rk@v  ,Xb8i       @@.  @@L 7m@@F.  3@F  Sb@b7   @@rm@t   S7:@m ;X@@X:   v#8D.        :.      
        :       8@a;rr  @@  .@@  @@;;@@s kmr;@@;     X@@S6@@r 7@#;;@@      @@:  @@r bE;;@@. s@C ;@i;U@H  @@@U#@@  @@@@b Zkr;@@; @@S:si       ,.       
       :        8@@@@@. @@   @@  @@ ,@@   ;7r8@t     @@.  Z@r @@aLL@@Y     @@@@@@L   ;7r@@r s@S  ,rr3@@  @@   @@7 @@r    ;7r8@3 v@@s        .,        
      ,.        @@r     @@  ,@@  @HFm7   @@r #@s     @@   b@r @@r.. ,.     @@r     ;@@;.@@r s@C @@F,r@@  @@   @@r @@;  .@@r.6@l   .b@H     .,         
     ,.         @@S     @@@8@@@  @@X6Zr  @@7L@@S     Y@@#@@@5 ;@@slZk      @@r     ;@@7L@@T X@P @@kr#@@  @@@b@@@  @@7  .@@iY@@F bE7#@8    .:          
    .,          ;C;      rXF ;L T@s  b@D  L63,vr      .Sm7 L;   Y6kEv.     rt;       5ks.L; .5r  rXE;;L  Yr.Cm7   ;S:    sPS.vr :X6a;     :           
   .,                           l@@Zk@@7                                                                                                 :            
  .:                              :r;:                                                                                                  :             
  :                                                                                                                                    :.             
 ,,..,.,.,.,.,.,.,.,.,.,.,.,.,.,.......,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,,.     "         
                                                                                                                                                      
*/
                                                      

arreglo_palabras:	
	.asciz	"h_la",				"ad_os",		"univ_rsidad",	"pat_",			"c_mputadora",	
			"organizac_on",		"ten_dor",		"aliment_r",	"p_labra",		"manzan_",	
			"Guatem_la",		"g_itarra",		"vari_ble",		"pr_gramacion",	"program_dor",	
			"fr_ta",			"v_rdura",		"amig_",		"florer_",		"pant_lla",
			"p_nto",			"flotant_",		"t_cla",		"rat_n",		"c_ble"
			"puert_",			"v_ntana",		"c_sa",			"t_cho",		"m_sil",
			"c_rrer",			"canc_on",		"music_",		"s_lla",		"m_sa",
			"pl_nta",			"hero_",		"vid_o",		"zap_to",		"hor_"

arreglo_letras:
	.asciz	"o", "i", "e", "o", "o",
			"i", "e", "a", "a", "a",
			"a", "u", "a", "o", "a",
			"u", "e", "o", "o", "a",
			"u", "e", "e", "o", "a",
			"a", "e", "a", "e", "i",
			"o", "i", "a", "i", "e",
			"a", "e", "e", "a", "a"

	.text
	.align	2
	.global		main
	.type		main,%function


	/*
	R5	Contador de palabras por juego
	R6  Contador de puntos del jugador 1
	R7	Contador de puntos del jugador 2
	*/
main:
	stmfd	sp!, {lr}
	contador_palabras	.req	R5
	contador1			.req	R6
	contador2			.req	R7

	MOV contador_palabras, #10
	MOV contador1, #0
	MOV contador2, #0

turno1:
	SUB contador_palabras, contador_palabras, #1
	LDR R0, =ingresar_vocal
	BL puts

	BL getchar
	LDR r0, =formato_vocal
	LDR r1, =vocal
	bl scanf

	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq Num_Mal1

	@Compara la letra ingresada con la letra faltante
	LDR R1, =vocal
	LDR R1, [R1]
	CMP R1, letra
	BEQ correcto1

correcto1:
	@Suma 5 puntos al contador de puntos del jugador 1
	add contador1, contador1, #5
	LDR R0, =formato_bien1
	LDR R1, contador1
	bl printf
	bl turno2

incorrecto1:
	@Resta 2 puntos al contador de puntos del jugador 1
	sub contador1, contador1, #2
	LDR R0, =formato_mal1
	LDR R1, contador1
	bl printf
	bl turno2

turno2:
	SUB contador_palabras, contador_palabras, #1
	LDR R0, =ingresar_vocal
	BL puts

	BL getchar
	LDR r0, =formato_vocal
	LDR r1, =vocal
	LDR r1, [r1]
	bl scanf

	@ compara y salta si r0 es 0 (error)
	cmp r0,#0
	beq Num_Mal2

	@Compara la letra ingresada con la letra faltante
	LDR R1, =vocal
	LDR R1, [R1]
	CMP R1, letra
	BEQ correcto2

correcto2:
	@Suma 5 puntos al contador de puntos del jugador 2
	add contador2, contador2, #5
	LDR R0, =formato_bien2
	LDR R1, contador2
	bl printf
	bl comparar

incorrecto2:
	@Resta 2 puntos al contador de puntos del jugador 2
	sub contador2, contador2, #2
	LDR R0, =formato_mal2
	LDR R1, contador2
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

fin:
	.unreq	contador_palabras
	.unreq	contador1
	.unreq	contador2

	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}
	bx lr