`timescale 1 ps / 1 ps
module mult_32_tb();

	reg [31:0] multipliar, multiplicant;
	reg start;
	wire [31:0] hi, lo;


	mult_32 mult(hi, lo, multipliar, multiplicant, start);
		
	initial 
		begin 
			multipliar   = 32'b00000000000000000000000000000001;
			multiplicant = 32'b00000000000000000000000000000010;
			start = 1'b1;
			
		end
		
	initial 
		begin
			$monitor("time = %2d\n multipliar  = %32b\n multiplicant = %32b\n hi = %32b\n lo = %32b\n Start = %1b\n\n",
				$time, multipliar, multiplicant, hi, lo, start);
		end
		
endmodule