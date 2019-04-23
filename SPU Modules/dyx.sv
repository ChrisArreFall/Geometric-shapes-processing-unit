module dxy #(parameter N)
    (input logic [N-1:0] a, BX,
     output logic [N-1:0] res);

    
	 logic [N-1:0] aa, b2, bcomplement, res_resta;
	 logic [N-1:0] two   = 2'b10;
	 
    mul #(N) mulaa(a,a, aa); 	  							   // a*a
	 mul #(N) mulb2(BX,two, b2);  							   // 2*BX
	 assign bcomplement =  ~b2;  					   		// -(2BX) //-9
	 
	 sumador #(N) suma_F(two,bcomplement,0,res_resta,cout);  // (1 - 2BX)
	 mul #(N) mulres(aa,res_resta, res);							// a*a*(1-(2BX))

	 
	 
	 
	 //assign  c = res; // DXY
                     // a*a*(1-2*BX)
endmodule 