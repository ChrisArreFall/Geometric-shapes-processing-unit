from lexer import Lexer
from parser import Parser

text_input = """ALT R6,R0,R0,R5,#0,#0"""

lexer = Lexer().get_lexer()
tokens = lexer.lex(text_input)


#for token in tokens:
#    print(token)

pg = Parser()
pg.parse() 
parser = pg.get_parser()
print('-------------------------------------------------------')
print(text_input + ' = ' + parser.parse(tokens).eval())
print('-------------------------------------------------------')