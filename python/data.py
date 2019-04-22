registers = {   
                # Register binary definition
                'R0':   '0000',
                'R1':   '0001',
                'R2':   '0010',
                'R3':   '0011',
                'R4':   '0100',
                'R5':   '0101',
                'R6':   '0110',
                'R7':   '0111',
                'R8':   '1000',
                'R9':   '1001',
                'R10':  '1010',
                'R11':  '1011',
                'R12':  '1100',
                'R13':  '1101',
                'R14':  '1110',
                'R15':  '1111'
            }

instructions =  {   
                    # Data proccesing instructions (op = 00 and 4bit funct)
                    'AND': '0000',
                    'EOR': '0001',
                    'OR' : '1100',
                    'ADD': '0100',
                    'SUB': '0010',
                    'LSL': '1000',
                    'LSR': '1001',
                    'CMP': '1010',

                    # Memory instructions (op = 01 and 6bit funct)
                    'STR': '000000',
                    'LDR': '000001',
                    
                    # Branch instructions (op = 10)
                    'B' : '10',

                    # Custom intructions (op = 11 and 4bit funct)
                    'ALT': '0000',  
                    'DIV': '0001',
                    'CAM': '0010',
                    'CAP': '0011',
                    'CAD': '0100',
                    'DR8': '0101',
                    'CD2': '0110',
                    'CD3': '0111',
                    'POT': '1000',
                    'DXY': '1001',
                    'MUL': '1010',
                    '2AB': '1011',
                    'DR1': '1100'
                }

conditions =    {
                    'EQ': '0000',
                    'NE': '0001',
                    'CS': '0010',
                    'HS': '0010',
                    'CC': '0011',
                    'LO': '0011',
                    'MI': '0100',
                    'PL': '0101',
                    'VS': '0110',
                    'VC': '0111',
                    'HI': '1000',
                    'LS': '1001',
                    'GE': '1010',
                    'LT': '1011',
                    'GT': '1100',
                    'LE': '1101',
                    'AL': '1110'
                }

# get the complement of a binary number
def complement(binary):

    added = False
    comp = ''
    bp1 = ''
    i = len(binary) - 1

    # Make the binary + 1
    while((i >= 0) and not(added)):

        if(binary[i] == '0'):
            bp1 = binary[0:i] + '1' + bp1
            added = True

        else:
            bp1 = '0' + bp1

        i -= 1
    
    # Just in case all the number had were ones
    if(not(added)):
         bp1 = '1' + bp1

    # Invert the values
    for i in range(0, len(bp1)):

        if(bp1[i] == '1'):   comp = comp + '0'
        else:                comp = comp + '1' 

    return comp


    
