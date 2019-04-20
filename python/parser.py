from rply import ParserGenerator
from ast import * 
from data import *


class Parser():
    def __init__(self):
        self.pg = ParserGenerator( 
            registers.keys() + instructions.keys() + conditions.keys() +
            ['INM', 'NUM', 'COMMA', 'LJUMP', 'SPACE']
        )

    def parse(self):

        # Define the program as a production build by multiple instructions
        # separated by line jumps or a single instruction
        @self.pg.production('program: instruction LJUMP program')
        @self.pg.production('program: instruction')
        def program(p):
            return Print(p[2])

        @self.pg.production('instruction: expression SUM expression')
        @self.pg.production('expression : expression SUB expression')
        def expression(p):
            left = p[0]
            right = p[2]
            operator = p[1]
            if operator.gettokentype() == 'SUM':
                return Sum(left, right)
            elif operator.gettokentype() == 'SUB':
                return Sub(left, right)

        @self.pg.production('expression : NUMBER')
        def number(p):
            return Number(p[0].value)

        @self.pg.error
        def error_handle(token):
            raise ValueError(token)

    def get_parser(self):
        return self.pg.build()