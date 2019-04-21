from data import *

# Define the characteristics of the instructions we'll use

# Common ARM instructions
class Instruction():
        def __init__(self, condition, op_code, predicate):
                # Define the common parts of an instruction so they can be
                # others can be made out of this

                # condition     31:28   Defines if the instruction has to be executed
                # op_code       27:26   Defines what kind of operation it is
                # predicate     25:0    Contains aditional data to execute the intruction
                self.condition = condition 
                self.op_code = op_code     
                self.predicate = predicate 

        def eval(self):
                return hex(int(self.condition + self.op_code + self.predicate , 2))

# Custom made instructions
class CustomInstruction():
        def __init__(self, extra_reg, activate_extra, function, a, c, color, shape, BX):
                # op_code for custom instructions
                op_code = '11'

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
                self.extra_reg =        extra_reg 
                self.op_code =          op_code 
                self.imm =              '0' 
                self.function =         function 
                self.activate_extra =   activate_extra
                self.a =                a 
                self.c =                c 
                self.b =                color + shape + BX
        
        def eval(self):
                # Return the hex value of the instruction
                return hex(int(self.extra_reg + self.op_code + self.imm + self.function + self.activate_extra + self.a + self.c + self.b, 2))



# Define subsets of instructions
class DataProcessingInstruction(Instruction):
        def __init__(self, condition, I, cmd, S, rn, rd, src2):
                # op_code for data process instructions
                op_code = '00'

                # I     25      Indicates if src2 is an immediate
                # cdm   24:21   Indicates the specific instruction to be excecuted
                # S     20      Indicates if condition flags have to be set
                # rn    19:16   First source register
                # rd    15:12   Destiny register
                # src2  11:0    Second source
                super().__init__(condition, op_code, I + cmd + S + rn + rd + src2)


class MemoryInstruction(Instruction):
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


class BranchInstruction(Instruction):
        def __init__(self, condition, function, imm24):
                # op_code for branch instructions
                op_code = '10'

                # function  25:24   Indicate wich branch is being executed
                # imm24     23:0    Instruction adress relative to PC + 8
                super().__init__(condition, op_code, function + imm24)       


class Register():
        def __init__(self, name):
                self.name = name

        def to_binary(self): 
                return registers[self.name]   

class Function():
        def __init__(self, name):
                self.name = name

        def to_binary(self): 
                return instructions[self.name]      

class Immediate():
        def __init__(self, imm):
                # Remove the # to get the number
                self.value = int(imm[1:])

        def get_value(self): 
                return self.value     