from rply import LexerGenerator
from data import *

class Lexer():

    def __init__(self):
        self.lexer = LexerGenerator()

    def _add_tokens(self):
        
        # Add the tokens the lexer will look for

        # Instructions
        for inst in instructions.keys():
            self.lexer.add(inst, inst) 

        # Registers
        for i in range(0, len(list(registers.keys()))):
            reg = list(registers.keys())[len(list(registers.keys())) - i - 1]
            self.lexer.add(reg, reg) 

        # Conditions
        for cond in conditions.keys():
            self.lexer.add(cond, cond) 
        
        # Inmediate
        self.lexer.add('-IMM', r'#-\d+')
        self.lexer.add('IMM', r'#\d+')

        # Comma
        self.lexer.add('COMMA', r',')

        # Spaces and line jumps
        self.lexer.add('LJUMP', r'\n')
        self.lexer.add('SPACE', r'\s')


    def get_lexer(self):
        self._add_tokens()
        return self.lexer.build()