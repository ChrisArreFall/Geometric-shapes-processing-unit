module cad #(parameter N)
    (input logic [N-1:0] a,
     output logic [N-1:0] res);

    logic [N-1:0] two = 2'b10;
    logic [N-1:0] four = 3'b100;
	 logic [N-1:0] a2;
	 logic [N-1:0] cout;
	 
    mul #(N) multi(two,a,a2);
	 
    sumador #(N) suma_F(four,~a2,0,res,cout);

    //assign  c = res; // CAD
                     // 3-2*a

endmodule