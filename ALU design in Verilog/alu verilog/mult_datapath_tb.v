`timescale 1 ps / 1 ps
module mult_datapath_tb();

wire [31:0] product_res, multipliar_res;
wire stop;
reg [31:0] multiplicant, multipliar;
reg multipliar_sign, product_sign, start_mult_sign, clk, count_sign;

	mult_datapath mult_dp(product_res, multipliar_res, stop, 
								multiplicant, multipliar, multipliar_sign, product_sign, start_mult_sign, clk, count_sign);
		
	initial 
		begin 
			multipliar   <= 32'b00000000000000000000000000000001;
			multiplicant <= 32'b00000000000000000000000000000010;
			multipliar_sign <= 1'b1;
			product_sign 	 <= 1'b1;
			start_mult_sign <= 1'b1;
			clk <=  1'b1;
			count_sign <= 1'b1;

		end

	always
		begin 
			#100 clk = ~clk;
		end
		
		initial begin
			$monitor("time = %2d\n multipliar  = %32b\n multiplicant = %32b\n product_res = %32b\n multipliar_res = %32b\n stop = %1b\n\n",
				$time, multipliar, multiplicant, product_res, multipliar_res, stop);
		end
		
endmodule
