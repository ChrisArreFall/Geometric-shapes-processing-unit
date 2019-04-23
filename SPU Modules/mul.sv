module mul #(parameter N=32)
    (input logic [N-1:0] a, 
	  input logic [N-1:0] BX,
	  output logic [N-1:0] res);

	  assign res = a * BX; 
	  
endmodule


/*module mul #(parameter N=32)
    (input logic [N-1:0] a, 
	  input logic [N-1:0] BX,
	  output logic [N-1:0] res);

	  assign res = a * BX; 
	  
endmodule */