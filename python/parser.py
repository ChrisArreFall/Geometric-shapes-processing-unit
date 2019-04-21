from rply import ParserGenerator
from ast import * 
from data import *


class Parser():
    def __init__(self):
        self.pg = ParserGenerator( 
            list(registers.keys()) + list(instructions.keys()) + list(conditions.keys()) +
            ['IMM', 'COMMA', 'LJUMP', 'SPACE']
        )


    def parse(self):

        # Define the top production
        @self.pg.production('instruction : data_inst')
        @self.pg.production('instruction : cmp')
        @self.pg.production('instruction : custom_inst')
        @self.pg.production('instruction : b_inst')
        def instruction(p):
            return p[0]

        # Define the rules of a data instruction
        @self.pg.production('data_inst : data_instruction SPACE reg COMMA reg COMMA reg')
        @self.pg.production('data_inst : data_instruction SPACE reg COMMA reg COMMA num')
        def data_inst(p):
            condition = '1110'
            I = '0'
            inst = p[0]
            S = '0'
            rd = p[2]
            rn = p[4]
            src2 = p[6]

            return DataProcessingInstruction(condition, I, inst, S, rn, rd, src2)

        # Specific case for CMP
        @self.pg.production('cmp : cmp_instruction SPACE reg COMMA reg')
        @self.pg.production('cmp : cmp_instruction SPACE reg COMMA num')
        def cmp(p):
            condition = '1110'
            I = '0'
            inst = instructions[p[0]]
            S = '1'
            rn = p[2]
            rd = '0000'
            src2 = p[4] 

            return DataProcessingInstruction(condition, I, inst, S, rn, rd, src2)


        
       
        # Define the rules of a custom instruction
        @self.pg.production('custom_inst : custom_instruction SPACE reg COMMA reg COMMA reg COMMA reg COMMA num COMMA num')
        def custom_inst(p):
            inst = p[0]
            a = p[2]
            EX = p[4]
            c = p[6]
            BX = p[8]
            shape = p[10]
            color = p[12]

            return CustomInstruction( EX, inst, a, c, color, shape, BX)

        # Define the rules of a branch instruction
        @self.pg.production('b_inst : branch_instruction cond SPACE num')
        def b_inst(p):
            inst = p[0]
            cond = p[1]
            imm24 = p[3]

            return BranchInstruction(cond, inst, imm24)





        # Define what a immediate is
        @self.pg.production('num : IMM')
        def num(p):
            return Immediate(p[0])

        # Define what a register is
        @self.pg.production('reg : R0')
        @self.pg.production('reg : R1')
        @self.pg.production('reg : R2')
        @self.pg.production('reg : R3')
        @self.pg.production('reg : R4')
        @self.pg.production('reg : R5')
        @self.pg.production('reg : R6')
        @self.pg.production('reg : R7')
        @self.pg.production('reg : R8')
        @self.pg.production('reg : R9')
        @self.pg.production('reg : R10')
        @self.pg.production('reg : R11')
        @self.pg.production('reg : R12')
        @self.pg.production('reg : R13')
        @self.pg.production('reg : R14')
        @self.pg.production('reg : R15')
        def reg(p):
            return Register(p[0])

        # Define what a condition is
        @self.pg.production('cond : EQ')
        @self.pg.production('cond : NE')
        @self.pg.production('cond : CS')
        @self.pg.production('cond : HS')
        @self.pg.production('cond : CC')
        @self.pg.production('cond : LO')
        @self.pg.production('cond : MI')
        @self.pg.production('cond : PL')
        @self.pg.production('cond : VS')
        @self.pg.production('cond : VC')
        @self.pg.production('cond : HI')
        @self.pg.production('cond : LS')
        @self.pg.production('cond : GE')
        @self.pg.production('cond : LT')
        @self.pg.production('cond : GT')
        @self.pg.production('cond : LE')
        @self.pg.production('cond : AL')
        def cond(p):
            return Condition(p[0])

        @self.pg.production('cmp_instruction : CMP')
        def cmp_instruction(p):
            return Function(p[0])

        @self.pg.production('branch_instruction : B')
        def branch_instruction(p):
            return Function(p[0])

        # Define what a data instruction is
        @self.pg.production('data_instruction : AND')
        @self.pg.production('data_instruction : OR')
        @self.pg.production('data_instruction : EOR')
        @self.pg.production('data_instruction : ADD')
        @self.pg.production('data_instruction : SUB')
        @self.pg.production('data_instruction : LSL')
        @self.pg.production('data_instruction : LSR')
        def data_instruction(p):
            return Function(p[0])

        # Define what a custom instruction is
        @self.pg.production('custom_instruction : ALT')
        @self.pg.production('custom_instruction : DIV')
        @self.pg.production('custom_instruction : CAM')
        @self.pg.production('custom_instruction : CAP')
        @self.pg.production('custom_instruction : CAD')
        @self.pg.production('custom_instruction : DR8')
        @self.pg.production('custom_instruction : CD2')
        @self.pg.production('custom_instruction : CD3')
        @self.pg.production('custom_instruction : POT')
        @self.pg.production('custom_instruction : DXY')
        @self.pg.production('custom_instruction : MUL')
        @self.pg.production('custom_instruction : 2AB')
        @self.pg.production('custom_instruction : DR1')
        def custom_instruction(p):
            return Function(p[0]) 


        @self.pg.error
        def error_handle(token):
            raise ValueError(token)

    def get_parser(self):
        return self.pg.build()