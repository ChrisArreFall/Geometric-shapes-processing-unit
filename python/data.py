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



                }