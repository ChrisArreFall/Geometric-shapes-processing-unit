module ab2 #(parameter N)
    (input logic [N-1:0] a, b,
     output logic [N-1:0] res);

    
	 logic [N-1:0] two = 2'b10;
	 logic [N-1:0] cout, res1; 
	 
    mul #(N) mult(two,a,res1);
    sumador #(N) suma_F(res1,b,0,res,cout);

    //assign  c = res; // 2AB
                     // 2*a+b
endmodule