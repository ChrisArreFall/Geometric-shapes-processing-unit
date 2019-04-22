from lexer import Lexer
from parser import Parser

text_input = """DIV R0,R0,R2,R1,#0,#0\n"""

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