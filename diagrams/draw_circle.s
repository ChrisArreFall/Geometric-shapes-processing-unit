;Funcion de circulo
;draw_circle(x0,y0,x1,y1)
;se le da una posicion de memoria donde esta un punto xc,yc y el radio(r)
; R1 = xc
; R2 = yc
; R3 = r
; R4 = d
; R5 = x
; R6 = y

.start

    SUB R1,R1,R1
    ADD R1,R1,#100

    SUB R2,R2,R2
    ADD R2,R2,#100

    SUB R3,R3,R3
    ADD R3,R3,#50


    SUB R5, R5, R5              ; x = 0
    #   a   EX  c   BX  sh  col  solo a se usa
    CAD R3, R0, R4, R0, #0, #0  ; d = 3 - 2r
    ADD R6, R5, R3              ; y = 0 + r
    #   a   EX  c   BX  sh  col
    DR8 R1, R5, R2, R6, #2, #32	; 8x points circle

.while
	ADD R5, R5, #1              ; x += 1
    CMP R4, #0                  ; if d < 0 
    BGE .elsee                  ; false
    #   a   EX  c   BX  sh  col  (EX, col, sh no se usa entonces no importa lo que se ponga)
    CD2 R5, R0, R4, R4, #0, #0 ; d = d + (4*x) + 6
    BAL .draw
.elsee
    #   a   EX  c   BX  sh  col  (EX, col, sh no se usa entonces no importa lo que se ponga)
    CD3 R5, R4, R4, R6, #0, #0  ; d = d + 4 * (x - y) + 10
    SUB R6, R6, #1              ; y -= 1

.draw
    #   a   EX  c   BX  sh  col
    DR8 R1, R5, R2, R6, #2, #32	; 8x points circle
    CMP R5, R6
    BLE .while
    
.end

