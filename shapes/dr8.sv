module dr8 #(parameter N=10)(input logic [2:0] shape,
									  input logic [3:0] code,
									  input logic [N-1:0] a, c, EX, BX,
									  output logic [159:0] posiciones);
	
	logic [9:0] xNext1,xNext2,xNext3,xNext4,xNext5,xNext6,xNext7,xNext8;
	logic [9:0] yNext1,yNext2,yNext3,yNext4,yNext5,yNext6,yNext7,yNext8;
	always_comb
			begin
				//Line1
				if(shape==2'b00)
					begin
						if(code == 4'b0101)
							begin
								xNext1 = a;
								xNext2 = a + BX;
								xNext3 = a + BX + BX;
								xNext4 = a + BX + BX + BX;
								xNext5 = a + BX + BX + BX + BX;
								xNext6 = a + BX + BX + BX + BX + BX;
								xNext7 = a + BX + BX + BX + BX + BX + BX;
								xNext8 = a + BX + BX + BX + BX + BX + BX + BX;
								yNext1 = c*xNext1+EX;
								yNext2 = c*xNext2+EX;
								yNext3 = c*xNext3+EX;
								yNext4 = c*xNext4+EX;
								yNext5 = c*xNext5+EX;
								yNext6 = c*xNext6+EX;
								yNext7 = c*xNext7+EX;
								yNext8 = c*xNext8+EX;
							end
						else
							begin
							xNext1 = a;
							yNext1 = c*a+EX;
							{xNext2,xNext3,xNext4,xNext5,xNext6,xNext7,xNext8}=70'b0;
							{yNext2,yNext3,yNext4,yNext5,yNext6,yNext7,yNext8}=70'b0;
							end
					end
				//Line2
				else if(shape == 2'b01)
					begin
						if(code == 4'b0101)
							begin
								yNext1 = a;
								yNext2 = a + BX;
								yNext3 = a + BX + BX;
								yNext4 = a + BX + BX + BX;
								yNext5 = a + BX + BX + BX + BX;
								yNext6 = a + BX + BX + BX + BX + BX;
								yNext7 = a + BX + BX + BX + BX + BX + BX;
								yNext8 = a + BX + BX + BX + BX + BX + BX + BX;
								xNext1 = c*yNext1+EX;
								xNext2 = c*yNext2+EX;
								xNext3 = c*yNext3+EX;
								xNext4 = c*yNext4+EX;
								xNext5 = c*yNext5+EX;
								xNext6 = c*yNext6+EX;
								xNext7 = c*yNext7+EX;
								xNext8 = c*yNext8+EX;
							end
						else
							begin
								yNext1 = a;
								xNext1 = c*a+EX;
								{xNext2,xNext3,xNext4,xNext5,xNext6,xNext7,xNext8}=70'b0;
								{yNext2,yNext3,yNext4,yNext5,yNext6,yNext7,yNext8}=70'b0;
							end
					end
				//Circulo
				else if(shape == 2'b10)
					begin
						//				xc      x
						xNext1 = a + c;
						xNext2 = a - c;
						xNext3 = a + c;
						xNext4 = a - c;
						xNext5 = a + c;
						xNext6 = a - c;
						xNext7 = a + c;
						xNext8 = a - c;
						//				yc      y
						yNext1 = a + c;
						yNext2 = a + c;
						yNext3 = a - c;
						yNext4 = a - c;
						yNext5 = a + c;
						yNext6 = a + c;
						yNext7 = a - c;
						yNext8 = a - c;
					end
				//Elipse
				else
					begin
						//				xc      x
						xNext1 = a + c;
						xNext2 = a - c;
						xNext3 = a + c;
						xNext4 = a - c;
						
						//				yc      y
						yNext1 = a + c;
						yNext2 = a + c;
						yNext3 = a - c;
						yNext4 = a - c;
					
						{xNext5,xNext6,xNext7,xNext8}=40'b0;
						{yNext5,yNext6,yNext7,yNext8}=40'b0;
					end
					
					
			
			end	
	assign posiciones[19:0] = {xNext1,yNext1};
	assign posiciones[39:20] = {xNext1,yNext1};
	assign posiciones[59:40] = {xNext1,yNext1};
	assign posiciones[79:60] = {xNext1,yNext1};
	assign posiciones[99:80] = {xNext1,yNext1};
	assign posiciones[119:100] = {xNext1,yNext1};
	assign posiciones[139:120] = {xNext1,yNext1};
	assign posiciones[159:140] = {xNext1,yNext1};
	
	
	
	
endmodule 