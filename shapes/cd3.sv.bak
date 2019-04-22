module cd3 #(parameter N)
    (input logic [N-1:0] D, a, b,
     output logic [N-1:0] res);

	logic [1:0] one = 1'b1;
	logic [N-1:0] four = 3'b100;
	logic [N-1:0] ten = 4'b1010;
	logic [N-1:0] ab, ab4, Dab4, cout, cout1, cout2;
	
	
	sumador #(N) suma_1(a,~b,one,ab,cout1);    	    // (a-b)
	mul #(N) mul(ab,four,ab4);	 						 	 // 4*(a-b)   
	sumador #(N) suma_2(ab4,D,0,Dab4,cout2);		 	 // D+4*(a-b)
	sumador #(N) suma_3(Dab4,ten,cout2,res,cout);	 // D+4*(a-b)+10
	  
endmodule 