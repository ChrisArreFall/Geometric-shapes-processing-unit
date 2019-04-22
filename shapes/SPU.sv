module SPU(input logic [31:0] a,c,EX,BX,
			  input logic [3:0] code,
			  input logic [1:0] shape,
			  input logic [5:0] color,
			  output logic [171:0] posicionesConColor,
			  output logic [31:0] SPUResult);
			  
			  
			  logic [31:0] ab2Res,altRes,cadRes,camRes,capRes,cd2Res,cd3Res,divRes,dr8Res,dyxRes,mulRes,potRes;
			  
			  
			  
			  
			  ab2 #(32)ab2_Unit(a,BX,ab2Res);
			  alt #(32)alt_Unit(a,BX,altRes);
			  cad #(32)cad_Unit(a,cadRes);
			  cam #(32)cam_Unit(a,BX,EX,camRes);
			  cap #(32)cap_Unit(a,BX,EX,capRes);
			  cd2 #(32)cd2_Unit(BX,a,cd2Res);
			  cd3 #(32)cd3_Unit(EX,a,BX,cd3Res);
			  div #(32)div_Unit(a,BX,divRes);
			  dr8 #(32)dr8_Unit(shape,code,a,c,EX,BX,posicionesConColor[159:0]);
			  dxy #(32)dyx_Unit(a,BX,dyxRes);
			  mul #(32)mul_Unit(a,BX,mulRes);
			  pot #(32)pot_Unit(a,BX,potRes);
			  
			  
			  always_comb 
				case(code)
					4'b0000 : SPUResult = altRes;			//ALT
					4'b0001 : SPUResult = divRes;			//DIV
					4'b0010 : SPUResult = camRes;			//CAM
					4'b0011 : SPUResult = capRes;			//CAP
					4'b0100 : SPUResult = cadRes;			//CAD
					4'b0110 : SPUResult = cd2Res;			//CD2
					4'b0111 : SPUResult = cd3Res;			//CD3
					4'b1000 : SPUResult = potRes;			//POT
					4'b1001 : SPUResult = dyxRes;			//DXY
					4'b1010 : SPUResult = mulRes;			//MUL
					4'b1011 : SPUResult = ab2Res;			//2AB
					default : SPUResult = 1'bx;
				endcase
			  
			  
			  assign posicionesConColor[165:160] = color;
			  assign posicionesConColor[169:166] = code;
			  assign posicionesConColor[171:170] = shape;
			  
			  
endmodule 