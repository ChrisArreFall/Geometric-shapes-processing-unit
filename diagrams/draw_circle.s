;Funcion de circulo
;draw_circle(x0,y0,x1,y1)
;se le da una posicion de memoria donde esta un punto xc,yc y el radio(r)
; R1 = xc
; R2 = yc
; R3 = r
; R4 = d
; R5 = x
; R6 = y
; R7 = contador

.start
    SUB R5, R5, R5              ; x = 0                                                             00000000
    #   a   EX  c   BX  sh  col  solo a se usa                                                      
    CAD R3, R0, R4, R0, #0, #0  ; d = 3 - 2r                                                        00000001
    ADD R6, R5, R3              ; y = 0 + r                                                         00000010
    #   a   EX  c   BX  sh  col
    DR8 R1, R5, R2, R6, #2, #32	; 8x points circle                                                  00000011

.while
	ADD R5, R5, #1              ; x += 1                                                            00000100
    CMP R4, #0                  ; if d < 0                                                          00000101
    BGE .elsee                  ; false                                                             00000110
    #   a   EX  c   BX  sh  col  (EX, col, sh no se usa entonces no importa lo que se ponga)        
    CD2 R5, R0, R4, R4, #0, #0 ; d = d + (4*x) + 6                                                  00000111
    B   .draw                                                                                  ;    00001000
.elsee
    #   a   EX  c   BX  sh  col  (EX, col, sh no se usa entonces no importa lo que se ponga)
    CD3 R5, R4, R4, R6, #0, #0  ; d = d + 4 * (x - y) + 10                                          00001001
    SUB R6, R6, #1              ; y -= 1                                                            00001010

.draw
    #   a   EX  c   BX  sh  col
    DR8 R1, R5, R2, R6, #2, #32	; 8x points circle                                                  00001011
    CMP R5, R6                                                                                     ;00001100
    BLE .while                                                                                     ;00001101
    CMP R7 
    
.end

