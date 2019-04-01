#Funcion de linea
#draw_line(x0,y0,x1,y1)
#se le da una posicion de memoria donde esta un punto x,y
#x0 = R1
#y0 = R2
#x1 = R3
#y1 = R4
#dx = R5
#dy = R6
#sx = R7
#sy = R8
#m  = R9
#p  = R10
#8  = R11
.start
	SUB R5,R3,R1 				#dx=x1-x0
	SUB R6,R4,R2               	#dy=y1-y0
	CMP R5,#0                  	#if dx < 0
	BLT ."if dx < 0"           	#true
	MOV R7, #1			  		#else: sx=1
	B   .calcularDY
."if dx < 0"
	MOV R7, #-1			  		#sx=-1
	B   .calcularDY				#
.calcularDY
	CMP R6,#0				  	#if dy < 0
	BLT ."if dy < 0"		  	#true
	MOV R8, #1			  		#else: sy=1
	B   ."calcularMP"
."if dy < 0"
	MOV R7, #-1			  		#sx=-1
	B   ."calcularMP"		
."calcularMP"
	ALT R0, R6, R5  			#abs(dy) < abs(dx)
	CMP R0, #1
	BEQ ."abs(dy) < abs(dx)"
	DIV R9, R5, R6				#m = dx / dy
	CAM R10, R1, R2, R9			#p = x0 - m*y0
	B ."while y0 + 8*sy != y1"
."abs(dy) < abs(dx)"
	DIV R9, R6, R5				#m = dy / dx
	CAM R10, R2, R1, R9			#p = y0 - m*x0
	CAP R0, R11, R7, R1 		#R0 = x0 + 8*sx
	CMP R0, R3					#y0 + 8*sy != y1
	BNE .true1
	B.true2
.true1
	#   a   b    c   EX   shape
	#   x0  m    p   sx     0
	DR8 R1, R9, R10, R8, #0		# matrix[x0,round(m*x0+p), :] = 0,  x0 += sx
	MUL R0, R7, R11				# R0 = 8*sx
	ADD R1, R1, R0				# x0 += R0
	B ."while y0 + 8*sy != y1"
.true2
	#   a   b    c   EX   shape
	#   y0  m    p   sy     0
	DR8 R1, R9, R10, R8, #2 	# matrix[x0,round(m*x0+p), :] = 0,  x0 += sx
	ADD R1, R1, R7				# x0 += sx
	B .end

."while y0 + 8*sy != y1"
	CAP R0, R11, R8, R2 		#R0 = y0 + 8*sy
	CMP R0, R4					#y0 + 8*sy != y1
	BNE .true3
	B	."while y0 != y1"
."while y0 != y1"
	CMP R2, R4
	BNE .true4
	B .end
.true3
	#   a   b    c   EX   shape
	#   y0  m    p   sy     0
	DR8 R2, R2, R10, R8, #1		# matrix[round(m*y0+p),y0, :] = 0,  y0 += sy
	MUL R0, R8, R11				# R0 = 8*sy
	ADD R2, R2, R0				# y0 += R0
	B ."while y0 + 8*sy != y1"
.true4
	#   a   b    c   EX   shape
	#   y0  m    p   sy     0
	DR8 R9, R2, R10, R8, #3 	# matrix[round(m*y0+p),y0, :] = 0,  y0 += sy
	ADD R2, R2, R8				# y0 += sy
	B ."while y0 + 8*sy != y1"
.end
