SUB R1,R1,R1
ADD R1,R1,#600
SUB R2,R2,R2
ADD R2,R2,#300
SUB R3,R3,R3
ADD R3,R3,#600
SUB R4,R4,R4
ADD R4,R4,#400
SUB R12,R12,R12
SUB R11,R11,R11
ADD R11,R11,#8
SUB R5,R3,R1
SUB R6,R4,R2
CMP R5,#0
BLT .ifdx<0
ADD R7,R12,#1
BAL .calcularDY
.ifdx<0 SUB R7,R12,#1
BAL .calcularDY
.calcularDY CMP R6,#0
BLT .ifdy<0
ADD R8,R12,#1
BAL ."calcularMP"
.ifdy<0 SUB R7,R12,#1
BAL ."calcularMP"
."calcularMP" ALT R6,R0,R0,R5,#0,#0
CMP R0,#1
BNE .abddy>=absdx
DIV R6,R0,R9,R5,#0,#0
CAM R2,R1,R10,R9,#0,#0
LSR R0,R5,#31
EOR R12,R0,R5
SUB R12,R12,R0
."while_steps>=8x" DR8 R1,R10,R9,R7,#0,#5
CAP R7,R1,R1,R11,#0,#0
SUB R12,R12,#8
CMP R12,#8
BGE ."while_steps>=8x"
."while_steps>0x" CMP R12,#0
BEQ .end
DR1 R1,R10,R9,R7,#0,#5
ADD R1,R1,R7
SUB R12,R12,#1
BAL ."while_steps>0x"
.abddy>=absdx DIV R5,R0,R9,R6,#0,#0
CAM R1,R2,R10,R9,#0,#0
LSR R0,R6,#31
EOR R12,R0,R6
SUB R12,R12,R0
."while_steps>=8y" DR8 R2,R10,R9,R8,#1,#5
CAP R8,R2,R2,R11,#0,#0
SUB R12,R12,#8
CMP R12,#8
BGE ."while_steps>=8y"
."while_steps>0y" CMP R12,#0
BEQ .end
DR1 R2,R9,R10,R8,#0,#5
ADD R2,R2,R8
SUB R12,R12,#1
BAL ."while_steps>0y"
.end SUB R1,R1,R1
ADD R1,R1,#600
SUB R2,R2,R2
ADD R2,R2,#400
SUB R3,R3,R3
ADD R3,R3,#500
SUB R4,R4,R4
ADD R4,R4,#400
SUB R12,R12,R12
SUB R11,R11,R11
ADD R11,R11,#8
SUB R5,R3,R1
SUB R6,R4,R2
CMP R5,#0
BLT .2ifdx<0
ADD R7,R12,#1
BAL .calcularDY2
.2ifdx<0 SUB R7,R12,#1
BAL .calcularDY2
.calcularDY2 CMP R6,#0
BLT .2ifdy<0
ADD R8,R12,#1
BAL ."calcularMP2"
.2ifdy<0 SUB R7,R12,#1
BAL ."calcularMP2"
."calcularMP2" ALT R6,R0,R0,R5,#0,#0
CMP R0,#1
BNE .2abddy>=absdx
DIV R6,R0,R9,R5,#0,#0
CAM R2,R1,R10,R9,#0,#0
LSR R0,R5,#31
EOR R12,R0,R5
SUB R12,R12,R0
."while_steps>=8x2" DR8 R1,R10,R9,R7,#0,#5
CAP R7,R1,R1,R11,#0,#0
SUB R12,R12,#8
CMP R12,#8
BGE ."while_steps>=8x2"
."while_steps>0x2" CMP R12,#0
BEQ .end2
DR1 R1,R10,R9,R7,#0,#5
ADD R1,R1,R7
SUB R12,R12,#1
BAL ."while_steps>0x2"
.2abddy>=absdx DIV R5,R0,R9,R6,#0,#0
CAM R1,R2,R10,R9,#0,#0
LSR R0,R6,#31
EOR R12,R0,R6
SUB R12,R12,R0
."2while_steps>=8y" DR8 R2,R10,R9,R8,#1,#5
CAP R8,R2,R2,R11,#0,#0
SUB R12,R12,#8
CMP R12,#8
BGE ."2while_steps>=8y"
."2while_steps>0y" CMP R12,#0
BEQ .end2
DR1 R2,R9,R10,R8,#0,#5
ADD R2,R2,R8
SUB R12,R12,#1
BAL ."2while_steps>0y"
.end2 SUB R1,R1,R1
ADD R1,R1,#500
SUB R2,R2,R2
ADD R2,R2,#400
SUB R3,R3,R3
ADD R3,R3,#600
SUB R4,R4,R4
ADD R4,R4,#300
SUB R12,R12,R12
SUB R11,R11,R11
ADD R11,R11,#8
SUB R5,R3,R1
SUB R6,R4,R2
CMP R5,#0
BLT .3ifdx<0
ADD R7,R12,#1
BAL .calcularDY3
.3ifdx<0 SUB R7,R12,#1
BAL .calcularDY3
.calcularDY3 CMP R6,#0
BLT .3ifdy<0
ADD R8,R12,#1
BAL ."calcularMP3"
.3ifdy<0 SUB R7,R12,#1
BAL ."calcularMP3"
."calcularMP3" ALT R6,R0,R0,R5,#0,#0
CMP R0,#1
BNE .3abddy>=absdx
DIV R6,R0,R9,R5,#0,#0
CAM R2,R1,R10,R9,#0,#0
LSR R0,R5,#31
EOR R12,R0,R5
SUB R12,R12,R0
."while_steps>=8x3" DR8 R1,R10,R9,R7,#0,#5
CAP R7,R1,R1,R11,#0,#0
SUB R12,R12,#8
CMP R12,#8
BGE ."while_steps>=8x3"
."while_steps>0x3" CMP R12,#0
BEQ .end3
DR1 R1,R10,R9,R7,#0,#5
ADD R1,R1,R7
SUB R12,R12,#1
BAL ."while_steps>0x3"
.3abddy>=absdx DIV R5,R0,R9,R6,#0,#0
CAM R1,R2,R10,R9,#0,#0
LSR R0,R6,#31
EOR R12,R0,R6
SUB R12,R12,R0
."3while_steps>=8y" DR8 R2,R10,R9,R8,#1,#5
CAP R8,R2,R2,R11,#0,#0
SUB R12,R12,#8
CMP R12,#8
BGE ."3while_steps>=8y"
."3while_steps>0y" CMP R12,#0
BEQ .end3
DR1 R2,R9,R10,R8,#0,#5
ADD R2,R2,R8
SUB R12,R12,#1
BAL ."3while_steps>0y"
.end3