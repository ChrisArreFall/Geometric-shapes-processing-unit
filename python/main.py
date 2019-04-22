from lexer import Lexer
from parser import Parser

# Initialize the lexer and parser
lexer = Lexer().get_lexer()
pg = Parser()
pg.parse() 
parser = pg.get_parser()

# Create the output file and save the path to the target
target = "/media/HDD/TEC/Arquitectura_de_computadores_I/Proyecto_grupal_I/diagrams/target_circle.s"


# Intermediate file generation
with  open(target, 'r') as input_text, open('intermediate.txt','w') as intermediate:

    # Identify labels in the code
    i = 0
    labels = {}
    lines = []
    for l in input_text:

        # Saves the line the label is in
        if(l.startswith('.')):
            j = 0

            # Search for the specific label name
            while(j < len(l) ):
                if((l[j] == ' ') or (l[j] == '\n')): break
                j += 1
            
            labels[l[0:j]] = i 

        lines.append(l)        
        i += 1

    i = 0
    # Calculate the immediate in branch operations using previous info
    for line in lines:

        # Calc the inmediate
        if(line.startswith('B')):
            j = 0

            # Search for the label
            while(j < len(line) ):
                if((line[j] == ' ') or (line[j] == '\n')): break
                j += 1
            
            # Calc the immediate
            label_line = labels[line[j+1:len(line) - 1]]
            if(label_line - i < 0):
                imm = str(labels[line[j+1:len(line) - 1]] - (i + 1))
            
            else:
                imm = str(labels[line[j+1:len(line) - 1]] - (i + 1) - 2)

            # Write the correct imm in the intermediate file
            intermediate.write(line[0: j+1] + '#' + imm + '\n')

        # Remove the label lines and write the normal ones
        elif (not(line.startswith('.'))):
            intermediate.write(line)
                
        i += 1
    

# Output file generation       
# Intermediate file generation
with  open('intermediate.txt', 'r') as program, open('circle_450_240_100.txt','w') as output:

    for line in program:

        # Get the tokens on the line
        tokens = lexer.lex(line)

        # Get them to the parser so they can be compiled and write the line
        output.write( parser.parse(tokens).eval() + '\n')

print('Done :)')

