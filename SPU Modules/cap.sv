module cap #(parameter N=32)(input logic [N-1:0] a,
								  input logic [N-1:0] BX, 
								  input logic [N-1:0] EX,
								  output logic [N-1:0] res);
	  
	 logic cout;
	 logic [N-1:0] res1; 
	 
    mul #(N) multi(a,BX,res1);
	 sumador #(N) suma_F(res1,EX,0,res,cout);
							// CAP
                     // a*BX+EX
							
endmodule 