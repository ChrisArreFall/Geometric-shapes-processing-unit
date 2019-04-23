module dxy #(parameter N)
    (input logic [N-1:0] a, b,
     output logic [N-1:0] res);

    
	 logic [N-1:0] aa, b2, bcomplement, res_resta;
	 logic [N-1:0] zero  = 1'b0;
	 logic [N-1:0] one   = 1'b1;
	 logic [N-1:0] two   = 2'b10;
	 logic [1:0] mini_one = 1'b1;
	 
    mul #(N) mulaa(a,a, aa); 	  							   // a*a
	 mul #(N) mulb2(b,two, b2);  							   // 2*b
	 assign bcomplement =  ~b2;  					   		// -(2b) //-9
	 
	 sumador #(N) suma_F(two,bcomplement,0,res_resta,cout);  // (1 - 2b)
	 mul #(N) mulres(aa,res_resta, res);							// a*a*(1-(2b))

	 
	 
	 
	 //assign  c = res; // DXY
                     // a*a*(1-2*b)
endmodule 