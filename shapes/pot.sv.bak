module pot #(parameter N=32)
    (input logic [N-1:0] a, b,
     output logic [N-1:0] res);

	 logic [N-1:0] ab, two;
	 assign two = 2'b10;
	 
    mul #(N) mul1(a,b, ab);
	 mul #(N) mul2(ab,two, res);
	 
endmodule
