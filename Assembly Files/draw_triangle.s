
;Funcion de linea
;draw_line(x0,y0,x1,y1)
;se le da una posicion de memoria donde esta un punto x,y
;x0 = R1
;y0 = R2
;x1 = R3
;y1 = R4
;dx = R5
;dy = R6
;sx = R7
;sy = R8
;m  = R9
;p  = R10
;8  = R11
;0 = R12
;steps = R13
.start

    SUB R1,R1,R1
    ADD R1,R1,#600              ; x0 = 600

    SUB R2,R2,R2
    ADD R2,R2,#300              ; y0 = 300

    SUB R3,R3,R3
    ADD R3,R3,#600              ; x1 = 600

    SUB R4,R4,R4
    ADD R4,R4,#400              ; y2 = 400

    SUB R12, R12, R12			; R12 = 0
	SUB R11, R11, R11			; R11 = 0
	ADD R11, R11, #8			; R11 = 8	

	SUB R5,R3,R1 				;dx=x1-x0
	SUB R6,R4,R2               	;dy=y1-y0
	CMP R5,#0                  	;if dx < 0
	BLT ."if dx < 0"           	;true
	ADD R7, R12, #1			  	;else: sx=1

	BAL   .calcularDY
."if dx < 0"
	SUB R7, R12, #1			  	;sx = -1
	BAL   .calcularDY				;

.calcularDY
	CMP R6,#0				  	;if dy < 0
	BLT ."if dy < 0"		  	;true
	ADD R8, R12, #1			  	;else: sy=1
	BAL   ."calcularMP"
."if dy < 0"
	SUB R7, R12, #1			  	;sy = -1
	BAL   ."calcularMP"	

."calcularMP"
    #   a   EX  c   BX  (EX c shape color not used)
	ALT R6, R0, R0, R5, #0, #0   			;abs(dy) < abs(dx)
	CMP R0, #1
	BNE ."abs(dy) >= abs(dx)"   ;false
    ; abs(dy) < abs(dx) case
    DIV R6, R0, R9, R5, #0, #0  ;m = dy / dx
    #   a   EX  c   BX  (shape color) = 0
	CAM R2, R1, R10, R9, #0, #0 ;p = y0 - m*x0
    
    LSR R0, R5, #31				;R0 = mask = dx >> 31
	EOR R12, R0, R5 			;R12 = mask EOR dx
	SUB R12, R12, R0			;R12 = (mask EOR dx) - mask = abs(dx) = steps

."while_steps>=8x"
    #   a   EX   c   BX   shape color
	#   x0  p    m   sx     0
	DR8 R1, R10, R9, R7, #0, #5	; 8x matrix[x0+n*sx,round(m*x0+p), :] = 0
    #   a   EX  c   BX  (shape color) = 0
    CAP R7, R1, R1, R11, #0, #0 ; x0 + 8*sx


    SUB R12, R12, #8            ; steps -= 8
    CMP R12, #8                 ; steps >= 8
    BGE ."while_steps>=8x"      ; true
."while_steps>0x"
    CMP R12, #0                 ; steps > 0
    BEQ .end
    #   a   EX   c   BX  shape color
	#   x0  p    m   sx  
    DR1 R1, R10, R9, R7, #0, #5 ; matrix[x0,round(m*x0+p), :] = 0
    ADD R1, R1, R7              ; x0 += sx
    SUB R12, R12, #1            ; steps -= 1
    BAL ."while_steps>0x"

; abs(dy) >= abs(dx) case
."abs(dy) >= abs(dx)"
    DIV R5, R0, R9, R6, #0, #0	;m = dx / dy
    #   a   EX   c  BX  (shape color) = 0
	CAM R1, R2, R10, R9, #0, #0	;p = x0 - m*y0

    LSR R0, R6, #31				;R0 = mask = dy >> 31
	EOR R12, R0, R6 			;R12 = mask EOR dy
	SUB R12, R12, R0			;R12 = (mask EOR dy) - mask = abs(dy) = steps

."while_steps>=8y"
    #   a   EX   c   BX   shape color
	#   y0  p    m   sy     1
	DR8 R2, R10, R9, R8, #1, #5	; 8x matrix[round(m*y0+p),y0, :] = 0
    #   a   EX  c   BX  (shape color) = 0
    CAP R8, R2, R2, R11, #0, #0 ; y0 + 8*sy
    SUB R12, R12, #8            ; steps -= 8
    CMP R12, #8                 ; steps >= 8
    BGE ."while_steps>=8y"      ; true
."while_steps>0y"
    CMP R12, #0                 ; steps > 0
    BEQ .end                    ; false
    #   a   EX   c   BX  shape  color
    #   y0  p    m   sx  
    DR1 R2, R9, R10, R8, #0, #5 ; matrix[round(m*y0+p),y0, :] = 0
    ADD R2, R2, R8              ; x0 += sx
    SUB R12, R12, #1            ; steps -= 1
    BAL ."while_steps>0y"

.end
; Start second line

    SUB R1,R1,R1
    ADD R1,R1,#600              ; x0 = 600

    SUB R2,R2,R2
    ADD R2,R2,#400              ; y0 = 400

    SUB R3,R3,R3
    ADD R3,R3,#500              ; x1 = 500

    SUB R4,R4,R4
    ADD R4,R4,#400              ; y2 = 400

    SUB R12, R12, R12			; R12 = 0
	SUB R11, R11, R11			; R11 = 0
	ADD R11, R11, #8			; R11 = 8	

	SUB R5,R3,R1 				;dx=x1-x0
	SUB R6,R4,R2               	;dy=y1-y0
	CMP R5,#0                  	;if dx < 0
	BLT ."2if dx < 0"           	;true
	ADD R7, R12, #1			  	;else: sx=1

	BAL   .calcularDY2
."2if dx < 0"
	SUB R7, R12, #1			  	;sx = -1
	BAL   .calcularDY2				;

.calcularDY2
	CMP R6,#0				  	;if dy < 0
	BLT ."2if dy < 0"		  	;true
	ADD R8, R12, #1			  	;else: sy=1
	BAL   ."calcularMP2"
."2if dy < 0"
	SUB R7, R12, #1			  	;sy = -1
	BAL   ."calcularMP2"	

."calcularMP2"
    #   a   EX  c   BX  (EX c shape color not used)
	ALT R6, R0, R0, R5, #0, #0   			;abs(dy) < abs(dx)
	CMP R0, #1
	BNE ."abs(dy) >= abs(dx)2"   ;false
    ; abs(dy) < abs(dx) case
    DIV R6, R0, R9, R5, #0, #0  ;m = dy / dx
    #   a   EX  c   BX  (shape color) = 0
	CAM R2, R1, R10, R9, #0, #0 ;p = y0 - m*x0
    
    LSR R0, R5, #31				;R0 = mask = dx >> 31
	EOR R12, R0, R5 			;R12 = mask EOR dx
	SUB R12, R12, R0			;R12 = (mask EOR dx) - mask = abs(dx) = steps

."while_steps>=8x2"
    #   a   EX   c   BX   shape color
	#   x0  p    m   sx     0
	DR8 R1, R10, R9, R7, #0, #5	; 8x matrix[x0+n*sx,round(m*x0+p), :] = 0
    #   a   EX  c   BX  (shape color) = 0
    CAP R7, R1, R1, R11, #0, #0 ; x0 + 8*sx


    SUB R12, R12, #8            ; steps -= 8
    CMP R12, #8                 ; steps >= 8
    BGE ."while_steps>=8x2"      ; true
."while_steps>0x2"
    CMP R12, #0                 ; steps > 0
    BEQ .end2
    #   a   EX   c   BX  shape color
	#   x0  p    m   sx  
    DR1 R1, R10, R9, R7, #0, #5 ; matrix[x0,round(m*x0+p), :] = 0
    ADD R1, R1, R7              ; x0 += sx
    SUB R12, R12, #1            ; steps -= 1
    BAL ."while_steps>0x2"

; abs(dy) >= abs(dx) case
."abs(dy) >= abs(dx)2"
    DIV R5, R0, R9, R6, #0, #0	;m = dx / dy
    #   a   EX   c  BX  (shape color) = 0
	CAM R1, R2, R10, R9, #0, #0	;p = x0 - m*y0

    LSR R0, R6, #31				;R0 = mask = dy >> 31
	EOR R12, R0, R6 			;R12 = mask EOR dy
	SUB R12, R12, R0			;R12 = (mask EOR dy) - mask = abs(dy) = steps

."2while_steps>=8y"
    #   a   EX   c   BX   shape color
	#   y0  p    m   sy     1
	DR8 R2, R10, R9, R8, #1, #5	; 8x matrix[round(m*y0+p),y0, :] = 0
    #   a   EX  c   BX  (shape color) = 0
    CAP R8, R2, R2, R11, #0, #0 ; y0 + 8*sy
    SUB R12, R12, #8            ; steps -= 8
    CMP R12, #8                 ; steps >= 8
    BGE ."2while_steps>=8y"      ; true
."2while_steps>0y"
    CMP R12, #0                 ; steps > 0
    BEQ .end2                    ; false
    #   a   EX   c   BX  shape  color
    #   y0  p    m   sx  
    DR1 R2, R9, R10, R8, #0, #5 ; matrix[round(m*y0+p),y0, :] = 0
    ADD R2, R2, R8              ; x0 += sx
    SUB R12, R12, #1            ; steps -= 1
    BAL ."2while_steps>0y"

.end2

    SUB R1,R1,R1
    ADD R1,R1,#500              ; x0 = 500

    SUB R2,R2,R2
    ADD R2,R2,#400              ; y0 = 400

    SUB R3,R3,R3
    ADD R3,R3,#600              ; x1 = 600

    SUB R4,R4,R4
    ADD R4,R4,#300              ; y2 = 300

    SUB R12, R12, R12			; R12 = 0
	SUB R11, R11, R11			; R11 = 0
	ADD R11, R11, #8			; R11 = 8	

	SUB R5,R3,R1 				;dx=x1-x0
	SUB R6,R4,R2               	;dy=y1-y0
	CMP R5,#0                  	;if dx < 0
	BLT ."3if dx < 0"           	;true
	ADD R7, R12, #1			  	;else: sx=1

	BAL   .calcularDY3
."3if dx < 0"
	SUB R7, R12, #1			  	;sx = -1
	BAL   .calcularDY3				;

.calcularDY3
	CMP R6,#0				  	;if dy < 0
	BLT ."3if dy < 0"		  	;true
	ADD R8, R12, #1			  	;else: sy=1
	BAL   ."calcularMP3"
."3if dy < 0"
	SUB R7, R12, #1			  	;sy = -1
	BAL   ."calcularMP3"	

."calcularMP3"
    #   a   EX  c   BX  (EX c shape color not used)
	ALT R6, R0, R0, R5, #0, #0   			;abs(dy) < abs(dx)
	CMP R0, #1
	BNE ."abs(dy) >= abs(dx)3"   ;false
    ; abs(dy) < abs(dx) case
    DIV R6, R0, R9, R5, #0, #0  ;m = dy / dx
    #   a   EX  c   BX  (shape color) = 0
	CAM R2, R1, R10, R9, #0, #0 ;p = y0 - m*x0
    
    LSR R0, R5, #31				;R0 = mask = dx >> 31
	EOR R12, R0, R5 			;R12 = mask EOR dx
	SUB R12, R12, R0			;R12 = (mask EOR dx) - mask = abs(dx) = steps

."while_steps>=8x3"
    #   a   EX   c   BX   shape color
	#   x0  p    m   sx     0
	DR8 R1, R10, R9, R7, #0, #5	; 8x matrix[x0+n*sx,round(m*x0+p), :] = 0
    #   a   EX  c   BX  (shape color) = 0
    CAP R7, R1, R1, R11, #0, #0 ; x0 + 8*sx


    SUB R12, R12, #8            ; steps -= 8
    CMP R12, #8                 ; steps >= 8
    BGE ."while_steps>=8x3"      ; true
."while_steps>0x3"
    CMP R12, #0                 ; steps > 0
    BEQ .end3
    #   a   EX   c   BX  shape color
	#   x0  p    m   sx  
    DR1 R1, R10, R9, R7, #0, #5 ; matrix[x0,round(m*x0+p), :] = 0
    ADD R1, R1, R7              ; x0 += sx
    SUB R12, R12, #1            ; steps -= 1
    BAL ."while_steps>0x3"

; abs(dy) >= abs(dx) case
."abs(dy) >= abs(dx)3"
    DIV R5, R0, R9, R6, #0, #0	;m = dx / dy
    #   a   EX   c  BX  (shape color) = 0
	CAM R1, R2, R10, R9, #0, #0	;p = x0 - m*y0

    LSR R0, R6, #31				;R0 = mask = dy >> 31
	EOR R12, R0, R6 			;R12 = mask EOR dy
	SUB R12, R12, R0			;R12 = (mask EOR dy) - mask = abs(dy) = steps

."3while_steps>=8y"
    #   a   EX   c   BX   shape color
	#   y0  p    m   sy     1
	DR8 R2, R10, R9, R8, #1, #5	; 8x matrix[round(m*y0+p),y0, :] = 0
    #   a   EX  c   BX  (shape color) = 0
    CAP R8, R2, R2, R11, #0, #0 ; y0 + 8*sy
    SUB R12, R12, #8            ; steps -= 8
    CMP R12, #8                 ; steps >= 8
    BGE ."3while_steps>=8y"      ; true
."3while_steps>0y"
    CMP R12, #0                 ; steps > 0
    BEQ .end3                   ; false
    #   a   EX   c   BX  shape  color
    #   y0  p    m   sx  
    DR1 R2, R9, R10, R8, #0, #5 ; matrix[round(m*y0+p),y0, :] = 0
    ADD R2, R2, R8              ; x0 += sx
    SUB R12, R12, #1            ; steps -= 1
    BAL ."3while_steps>0y"

.end3
