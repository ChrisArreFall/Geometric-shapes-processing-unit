from rply import ParserGenerator
from ast import * 
from data import *


class Parser():
    def __init__(self):
        self.pg = ParserGenerator( 
            registers.keys() + instructions.keys() + conditions.keys() +
            ['IMM', 'COMMA', 'LJUMP', 'SPACE']
        )

    def parse(self):

        # Define the rules of a data instruction
        @self.pg.production('data_inst: data_instruction SPACE reg COMMA reg COMMA reg')
        @self.pg.production('data_inst: data_instruction SPACE reg COMMA reg COMMA num')
        def data_inst(p):
            condition = '1110'
            I = '0'
            inst = p[0]
            S = '0'
            rd = p[2]
            rn = p[4]
            src2 = p[6]

            # Decode value if an immediate is used
            if(type(src2) == int):
                I = '1'
                src2 = "{0:b}".format(src2)

            return DataProcessingInstruction(condition, I, inst, S, rn, rd, src2)

        '''# Specific case for cmp
        @self.pg.production('cmp: CMP SPACE reg COMMA reg')
        @self.pg.production('cmp: CMP SPACE reg COMMA num')
        def cmp(p):
            condition = '1110'
            I = '0'
            inst = instructions[p[0]]
            S = '1'
            rn = p[2]
            src2 = p[4] 

            # Decode value if an immediate is used
            if(type(src2) == int):
                I = '1'
                src2 = "{0:b}".format(src2)

            return DataProcessingInstruction(condition, I, inst, S, rn, src2)'''


        
       
        # Define the rules of a data instruction
        @self.pg.production('custom_inst: custom_instruction SPACE reg COMMA reg COMMA reg COMMA reg COMMA num COMMA num')
        def custom_inst(p):
            inst = p[0]
            S = '0'
            rd = p[2]
            rn = p[4]
            src2 = p[6]

            # Decode value if an immediate is used
            if(type(src2) == int):
                I = '1'
                src2 = "{0:b}".format(src2)

            return CustomInstruction( I, inst, S, rn, rd, src2)





        # Define what a immediate is
        @self.pg.production('num: IMM')
        def num(p):
            return Immediate(p[0]).get_value()

        # Define what a register is
        @self.pg.production('reg: R0')
        @self.pg.production('reg: R1')
        @self.pg.production('reg: R2')
        @self.pg.production('reg: R3')
        @self.pg.production('reg: R4')
        @self.pg.production('reg: R5')
        @self.pg.production('reg: R6')
        @self.pg.production('reg: R7')
        @self.pg.production('reg: R8')
        @self.pg.production('reg: R9')
        @self.pg.production('reg: R10')
        @self.pg.production('reg: R11')
        @self.pg.production('reg: R12')
        @self.pg.production('reg: R13')
        @self.pg.production('reg: R14')
        @self.pg.production('reg: R15')
        def reg(p):
            return Register(p[0]).to_binary()


        # Define what a data instruction is
        @self.pg.production('data_instruction: AND')
        @self.pg.production('data_instruction: OR')
        @self.pg.production('data_instruction: EOR')
        @self.pg.production('data_instruction: ADD')
        @self.pg.production('data_instruction: SUB')
        @self.pg.production('data_instruction: LSL')
        @self.pg.production('data_instruction: LSR')
        def data_instruction(p):
            return Function(p[0]).to_binary() 


        @self.pg.error
        def error_handle(token):
            raise ValueError(token)

    def get_parser(self):
        return self.pg.build()