from data import *

# Define the characteristics of the instructions we'll use

# Custom made instructions
class CustomInstruction():
        def __init__(self, extra_reg, function, a, c, color, shape, BX):
                # extra_reg         31:28       Uses this register in case its needed  
                # op_code           27:26       Defines what kind of operation it is
                # imm               25          Indicates if b is an immediate (always 0)
                # function          24:21       Indicates the specific function to execute
                # activate_extra    20          Indicates if the extra register is needed
                # a                 19:16       First source
                # c                 15:12       Destiny register
                # color             11:6        Defines the color of the pixel in drawing op
                # shape             5:4         Indicates the figure in drawing functions
                # BX                3:0         Register
                self.extra_reg          = extra_reg 
                self.op_code            = '11' 
                self.imm                = '0' 
                self.function           = function.eval() 
                self.activate_extra     = '0'
                self.a                  = a 
                self.c                  = c 

                # Decode value if an immediate is used
                shape = shape.eval()
                if(type(shape) == int):
                        shape = "{0:b}".format(shape)
                        shape = (2 - len(shape)) * '0' + shape

                color = color.eval()
                if(type(color) == int):
                        color = "{0:b}".format(color)
                        color = (6 - len(color)) * '0' + color

                self.b                  = color + shape + BX.eval()

                #       CAM                           CAP                          DR8
                if(     (self.function == '0010') or (self.function == '0011') or (inst == '0101') or 
                        (self.function == '0111') or (self.function == '1100')):
                #        CD3                          DR1
                        self.activate_extra = '1'
        
        def eval(self):
                # Return the hex value of the instruction
                return hex(int( self.extra_reg.eval()   + 
                                self.op_code            + 
                                self.imm                + 
                                self.function           + 
                                self.activate_extra     + 
                                self.a.eval()           + 
                                self.c.eval()           + 
                                self.b                  , 2))



# Define subsets of instructions
class DataProcessingInstruction():
        def __init__(self, condition, I, cmd, S, rn, rd, src2):
                # condition     31:28   Defines if the instruction has to be executed
                # op_code       27:26   Defines what kind of operation it is
                # I     25      Indicates if src2 is an immediate
                # cdm   24:21   Indicates the specific instruction to be excecuted
                # S     20      Indicates if condition flags have to be set
                # rn    19:16   First source register
                # rd    15:12   Destiny register
                # src2  11:0    Second source
                self.condition          = condition 
                self.op_code            = '00'
                self.I                  = I
                self.cmd                = cmd 
                self.S                  = S
                self.rn                 = rn

                if(type(rd) == str): 
                        self.rd         = rd 

                else:
                        self.rd         = rd.eval()

                # Decode value if an immediate8 is used
                src2 = src2.eval()
                if(type(src2) == int):
                        I = '1'
                        self.src2 = "{0:b}".format(src2)
                        self.src2 = (8 - len(self.src2)) * '0' + self.src2
                        # Rotation is added, since we dont need to represent big numbers
                        # there is no need to calculate the rotation
                        self.src2 = '0000' + self.src2

                # Add data if a register is provided    
                else:
                        # shamt5, sh and 0 added
                        self.src2 = '00000'  + '00' + '0' + src2
        def eval(self):
                
                return hex(int( self.condition         + 
                                self.op_code           + 
                                self.I                 +
                                self.cmd.eval()        +
                                self.S                 +
                                self.rn.eval()         +
                                self.rd                +
                                self.src2              , 2))

'''
class MemoryInstruction():
        def __init__(self, condition, NOT_I, P, U, B, W, L, rn, rd, src2):
                # op_code for data process instructions
                op_code = '01'

                # NOT_I 25      Indicates if src2 is an immediate or a register
                # P     24      (pre-index) Specifies the index mode
                # U     23      (add) Indicates if src2 should be added or substracted
                # B     22      (byte) Helps specifying the type of memory operation
                # W     21      (writeback) Helps specifying the index mode
                # L     20      (load) Specify the type of memory operation
                # rn    19:16   First source register
                # rd    15:12   Destiny register
                # src2  11:0    Second source
                super().__init__(condition, op_code, NOT_I + P + U + B + W + L + rn + rd + src2)

        def eval(self):
                return hex(int(self.condition + self.op_code + self.predicate , 2))'''



class BranchInstruction():
        def __init__(self, condition, function, imm24):
                # condition 31:28   Defines if the instruction has to be executed
                # op_code   27:26   Defines what kind of operation it is
                # function  25:24   Indicate wich branch is being executed
                # imm24     23:0    Instruction adress relative to PC + 8
                self.condition          = condition 
                self.op_code            = '10'
                self.function           = function

                # Decode value if an immediate is used
                imm24 = imm24.eval()
                if(type(imm24) == int):
                        self.imm24 = "{0:b}".format(imm24)
                        self.imm24 = (24 - len(self.imm24)) * '0' + self.imm24
 

        def eval(self):
                return hex(int( self.condition.eval()   + 
                                self.op_code            + 
                                self.function.eval()    +
                                self.imm24              , 2))   


class Register():
        def __init__(self, name):
                self.name = name

        def eval(self): 
                return registers[self.name]   

class Condition():
        def __init__(self, name):
                self.name = name

        def eval(self): 
                return conditions[self.name]   

class Function():
        def __init__(self, name):
                self.name = name

        def eval(self): 
                return instructions[self.name]      

class Immediate():
        def __init__(self, imm):
                # Remove the # to get the number
                self.value = int(imm[1:])

        def eval(self): 
                # TODO AGREGAR COMPLEMENTO A DOS PARA NUMEROS NEGATIVOS
                return self.value     