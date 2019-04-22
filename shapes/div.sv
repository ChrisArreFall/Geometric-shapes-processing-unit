module div #(parameter N) // sign division
    (input logic [N-1:0] a, 
	  input logic [N-1:0] BX,
     output logic [N-1:0] res);

	logic [1:0] sign;
	logic [1:0] one=1'b1;
	logic [N-1:0] abs_a, abs_b;
	
	assign sign = a[31]^BX[31];
	
	always @*
		begin
			if (a[31]==one)  
				begin
					abs_a <= ~a;
				end
			else
				begin 
					abs_a <= a;
				end
			if (BX[31]==one)  	
				begin
					abs_b <= ~BX;
				end
			else 
				begin 
					abs_b <= BX;
				end
			res= abs_a / abs_b;
			if (sign == one)
				res = ~res;
		end
endmodule 