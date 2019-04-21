from lexer import Lexer

text_input = """SUB R5,R3,#333"""

lexer = Lexer().get_lexer()
tokens = lexer.lex(text_input)

for token in tokens:
    print(token)