module cd3 #(parameter N)
    (input logic [N-1:0] EX, a, BX,
     output logic [N-1:0] res);

	logic [1:0] one = 1'b1;
	logic [N-1:0] four = 3'b100;
	logic [N-1:0] ten = 4'b1010;
	logic [N-1:0] ab, ab4, Dab4, cout, cout1, cout2;
	
	
	sumador #(N) suma_1(a,~BX,one,ab,cout1);    	    // (a-BX)
	mul #(N) mul(ab,four,ab4);	 						 	 // 4*(a-BX)   
	sumador #(N) suma_2(ab4,EX,0,Dab4,cout2);		 	 // EX+4*(a-BX)
	sumador #(N) suma_3(Dab4,ten,cout2,res,cout);	 // EX+4*(a-BX)+10
	  
endmodule 