module cap #(parameter N)
    (input logic [N-1:0] a,
	  input logic [N-1:0] M, 
	  input logic [N-1:0] P,
     output logic [N-1:0] res);
	  
	 logic cout;
	 logic [N-1:0] res1; 
	 
    mul #(N) multi(a,M,res1);
	 sumador #(N) suma_F(res1,P,0,res,cout);
							// CAP
                     // a*M+P
							
endmodule 