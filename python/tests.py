from lexer import Lexer
from parser import Parser

text_input = """SUB R5,R5,R5"""

lexer = Lexer().get_lexer()
tokens = lexer.lex(text_input)


#for token in tokens:
#    print(token)

pg = Parser()
pg.parse() 
parser = pg.get_parser()
parser.parse(tokens).eval()