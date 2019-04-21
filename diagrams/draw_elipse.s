;Funcion de elipse
;draw_elipse(xc,yc,rx,ry)
;se le da una posicion de memoria donde esta un punto xc,yc y el radio en x y en y(rx,ry)
; R1 = xc
; R2 = yc
; R3 = rx
; R4 = ry
; R5 = x
; R6 = y
; R7 = potx
; R8 = poty
; R9 = error
; R10 = paradax
; R11 = paraday
; R12 = dx
; R13 = dy

.start

    #   a   EX  c   BX  sh  col (EX, sh, col no se usan)
    POT R3, R0, R7, R3, #0, #0      ; potx = 2*rx*rx
    POT R4, R0, R8, R4, #0, #0      ; poty = 2*ry*ry

    SUB R6, R6, R6                  ; y = 0
    SUB R9, R9, R9                  ; error = 0
    SUB R11, R11, R11               ; paraday = 0

    ADD R5, R6, R3                  ; x = 0 + rx
    #   a   EX  c    BX  sh  col (EX, sh, col no se usan)
    DXY R4, R0, R12, R3, #0, #0     ; dx = ry*ry*(1 - 2*rx)
    MUL R3, R0, R13, R3, #0, #0     ; dy = rx*rx
    MUL R8, R0, R10, R3, #0, #0     ; paradax = poty*rx

.while1
    CMP R10, R11                    ; paradax < paraday
    BLT .end1                       ; true

    #   a   EX  c   BX  sh  col
    DR8 R1, R5, R2, R6, #3, #63     ; 4x points draw
    ADD R6, R6, #1                  ; y += 1
    ADD R11, R11, R7                ; paraday += potx
    ADD R9, R9, R13                 ; error += dy
    ADD R13, R13, R7                ; dy += potx

    #   a   EX  c   BX  sh  col      EX, sh, col no se usan
    2AB R9, R0, R0, R12, #0, #0     ; 2*error + dx
    CMP R0, #0                      ; if((2*error + dx) > 0)
    BLE .while1                     ; false

    SUB R5, R5, #1                  ; x -= 1
    SUB R10, R10, R8                ; paradax -= poty
    ADD R9, R9, R12                 ; error += dx
    ADD R12, R12, R8                 ; dx += poty
    B .while1

.end1
    SUB R5, R5, R5                  ; x = 0
    SUB R9, R9, R9                  ; error = 0
    SUB R10, R10, R10               ; paradax = 0

    ADD R6, R5, R4                  ; y = 0 + ry
    #   a   EX  c    BX  sh  col (EX, sh, col no se usan)
    DXY R3, R0, R13, R4, #0, #0     ; dy = rx*rx*(1 - 2*ry)
    MUL R4, R0, R12, R4, #0, #0     ; dx = ry*ry
    MUL R7, R0, R11, R4, #0, #0     ; paraday = potx*ry

.while2
    CMP R10, R11                    ; paradax > paraday
    BGT .end                        ; true

    #   a   EX  c   BX  sh  col
    DR8 R1, R5, R2, R6, #3, #63     ; 4x points draw
    ADD R5, R5, #1                  ; x += 1
    ADD R10, R10, R8                ; paradax += poty
    ADD R9, R9, R12                 ; error += dx
    ADD R12, R12, R8                ; dx += poty

    #   a   EX  c   BX  sh  col      EX, sh, col no se usan
    2AB R9, R0, R0, R13, #0, #0     ; 2*error + dy
    CMP R0, #0                      ; if((2*error + dy) > 0)
    BLE .while2                     ; false

    SUB R6, R6, #1                  ; y -= 1
    SUB R11, R11, R7                ; paraday -= potx
    ADD R9, R9, R13                 ; error += dy
    ADD R13, R13, R7                ; dy += potx
    B .while2
.end











