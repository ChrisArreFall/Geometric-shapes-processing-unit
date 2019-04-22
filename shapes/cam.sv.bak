module cam #(parameter N)
    (input logic [N-1:0] a, b, M,
     output logic [N-1:0] res);
	
	logic [1:0] one = 1'b1;
	logic [N-1:0] res1, cout;
	
	
   mul #(N) multi(M, b, res1);					 // M*b
   sumador #(N) suma_F(a,~res1,one,res,cout); // a-M*b
                     
endmodule 