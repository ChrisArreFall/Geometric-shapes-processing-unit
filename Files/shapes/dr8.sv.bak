module dr8 #(parameter N)
  (input logic clk, WE;
   input logic [2:0] shape, 
   input logic [N-1:0] a, b, c, 
	input logic [N-1:0] ,
	input logic [5:0] color,
   output logic [1:0] res);
	
	input logic clk,WE,
						 input logic [31:0] A,WD,
						 output logic [31:0] RD)
	
	ALU_N_bits#(N) alu1(A, B,ALUControl,flags,RESULT1);
	ALU_N_bits#(N) alu2(A, B,ALUControl,flags,RESULT2);
	ALU_N_bits#(N) alu3(A, B,ALUControl,flags,RESULT3);
	ALU_N_bits#(N) alu4(A, B,ALUControl,flags,RESULT4);
	ALU_N_bits#(N) alu5(A, B,ALUControl,flags,RESULT5);
	ALU_N_bits#(N) alu6(A, B,ALUControl,flags,RESULT6);
	ALU_N_bits#(N) alu7(A, B,ALUControl,flags,RESULT7);
	ALU_N_bits#(N) alu8(A, B,ALUControl,flags,RESULT8);
	
	always_comb
			case(shape)
				2'b00:   // linea 
					
				2'b01:   // Elipse
					
				2'b10:   // Circulo
				
				2'b11:	// Triangulo 
				
			default:
			endcase
	
	
	
endmodule 