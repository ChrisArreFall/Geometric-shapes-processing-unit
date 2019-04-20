from lexer import Lexer

text_input = """SUB R5,R3,R1
ADD R0, R1, R2"""

lexer = Lexer().get_lexer()
tokens = lexer.lex(text_input)

for token in tokens:
    print(token)