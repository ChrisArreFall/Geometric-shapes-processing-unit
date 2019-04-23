module cd2 #(parameter N)
    (input logic [N-1:0] BX, a,
     output logic [N-1:0] res);

   logic [N-1:0] four = 3'b100;
	logic [N-1:0] six = 3'b110; 
	logic [N-1:0] cout;
	logic [N-1:0] cout1;
	logic [N-1:0] a4;
	logic [N-1:0] a4D; 
	
   mul #(N) mul(four, a, a4);	// 4*a
	
   sumador #(N) suma_1(a4, BX, 0, a4D, cout1);  //BX + 4*a
	
	sumador #(N) suma_2(six, a4D, cout1, res, cout); // BX+(4*a)+6
	
   //assign  c = res; // CD2
                     // BX+(4*a)+6
endmodule 