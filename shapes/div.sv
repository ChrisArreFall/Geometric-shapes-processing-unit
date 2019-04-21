module div #(parameter N) // sign division
    (input logic [N-1:0] a, 
	  input logic [N-1:0] b,
     output logic [N-1:0] res);

	logic [1:0] sign;
	logic [1:0] one=1'b1;
	logic [N-1:0] abs_a, abs_b;
	
	assign sign = a[31]^b[31];
	
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
			if (b[31]==one)  	
				begin
					abs_b <= ~b;
				end
			else 
				begin 
					abs_b <= b;
				end
			res= abs_a / abs_b;
			if (sign == one)
				res = ~res;
		end
endmodule 