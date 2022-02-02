module mult_alu_tb();

reg [31:0] product, multipliar, multiplicant;
reg alu_sign;
wire [31:0] multipliar_res, product_res;
	
	mult_alu g(multipliar_res, product_res, product, multipliar, multiplicant, alu_sign);
	
	initial 
		begin 
			product 		= 32'b00000000000000000000000000000001;
			multiplicant= 32'b00000000000000000000000000000010;	
			multipliar 	= 32'b11000000000000000000000000000110;
			alu_sign 	= 1'b0;
			
		#100 
			product 		 = 32'b00000000000000000000000000000001;
			multiplicant = 32'b01000000000000000000000000001110;
			multipliar   = 32'b00000000000000000000000000000000;	
			alu_sign     = 1'b1;
			
		end
		
		initial begin
			$monitor("time = %2d\n product = %32b\n multipliar = %32b \n multiplicant = %32b\n alu_sign = %1b \n product_res = %32b\n multipliar_res = %32b \n\n", 
						$time, product, multipliar, multiplicant, alu_sign, product_res, multipliar_res);
		end
	
endmodule 
