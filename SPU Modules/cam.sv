module cam #(parameter N)(input logic [N-1:0] a, BX, EX,
								  output logic [N-1:0] res);
	
	logic [1:0] one = 1'b1;
	logic [N-1:0] res1, cout;
	
	
   mul #(N) multi(EX, BX, res1);					 // EX*BX
   sumador #(N) suma_F(a,~res1,one,res,cout); // a-EX*BX
                     
endmodule 