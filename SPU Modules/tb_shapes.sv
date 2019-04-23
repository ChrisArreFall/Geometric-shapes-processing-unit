module tb_shapes#(parameter N=32);
	
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic [N-1:0] M, P, D; 
	
	logic [N-1:0] res_mul;
	logic [N-1:0] res_div;
	logic [N-1:0] res_pot;
	logic [N-1:0] res_cap;
	logic [N-1:0] res_ab2;
	logic [N-1:0] res_dxy;
	logic [N-1:0] res_cad;
	logic [N-1:0] res_cd2;
	logic [N-1:0] res_cd3;
	logic [N-1:0] res_cam;
	logic [1:0]   res_alt;
	
	mul #(N) mul( a, b, res_mul);
	div #(N) div( a, b, res_div);
	pot #(N) pot( a, b, res_pot);
	cap #(N) cap( a, M, P, res_cap);
	ab2 #(N) ab2( a, b, res_ab2);
	dxy #(N) dxy( a, b, res_dxy);
	cad #(N) cad( a, res_cad);
	cd2 #(N) cd2( D, a , res_cd2);
	cd3 #(N) cd3( D, a , b, res_cd3);
	cam #(N) cam( a, b, M, res_cam);
   alt #(N) alt( a, b, res_alt);
	
	// initialize test 	
	initial 
		begin  
			# 10;
			a	<= 32'b11111111111111111111111111111100;//a	<= 32'b0000010;
			b	<= 32'b0000100;
			M	<= 32'b0000100;
			P	<= 32'b0000010;
			D	<= 32'b0000010;
			# 10;
			a	<= 32'b1000001;
			b	<= 32'b0101000;
			M	<= 32'b0000100;
			P	<= 32'b0000110;
			D	<= 32'b0000110;
			# 10;
			a	<= 32'b0001001;
			b	<= 32'b0100010;
			M	<= 32'b0000001;
			P	<= 32'b0010010;
			D	<= 32'b0001010;
			# 10;
			a	<= 32'b0001101;
			b	<= 32'b0100001;
			M	<= 32'b0001100;
			P	<= 32'b0000111;
			D	<= 32'b0010011;
			# 10;
			a	<= 32'b0000101;
			b	<= 32'b0101001;
			M	<= 32'b0000100;
			P	<= 32'b0000011;
			D	<= 32'b0100111;
			# 10;
			a	<= 32'b0100101;
			b	<= 32'b0001001;
			M	<= 32'b0010100;
			P	<= 32'b0010011;
			D	<= 32'b0100011;
			# 10;
			a	<= 32'b1000001;
			b	<= 32'b0101000;
			M	<= 32'b0000100;
			P	<= 32'b0000110;
			D	<= 32'b0000110;
	end

endmodule 