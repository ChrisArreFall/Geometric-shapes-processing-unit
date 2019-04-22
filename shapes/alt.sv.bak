module alt #(parameter N)
  (input logic [N-1:0] a, b,
   output logic [1:0] res);
	
	logic [N-1:0] abs_a, abs_b;
	
	always @*
	begin
		if (a[31]==1'b1)  
			begin
				abs_a <= ~a+1;
			end
		else
			begin 
				abs_a <= a;
			end
		if (b[31]==1'b1)  	
			begin
				abs_b <= ~b+1;
			end
		else 
			begin 
				abs_b <= b;
			end
	end
	assign res = abs_a > abs_b;

	
endmodule 