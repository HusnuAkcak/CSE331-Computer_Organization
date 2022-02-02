`timescale 1 ps / 1 ps
module mult_32(hi, lo, multipliar, multiplicant, start);

output [31:0] hi, lo;
input [31:0] multipliar, multiplicant;
input start;


	wire stop,
			multipliar_sign, 
			product_sign, 
			start_mult_sign, 
			count_sign;

	reg clk;
	
	initial 
	begin 
		clk <= 1'b0;	
	end
	
	always 
	begin 
		#1 clk <= ~clk;
	end

	mult_control control(count_sign, multipliar_sign, product_sign, start_mult_sign, clk, start, stop);
	mult_datapath datapath(hi, lo, stop, multiplicant, multipliar, multipliar_sign, product_sign, start_mult_sign, clk, count_sign);
	

	
endmodule 
