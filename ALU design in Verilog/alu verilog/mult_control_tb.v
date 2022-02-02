`timescale 1 ps / 1 ps
module mult_control_tb();

	reg clk, start, done;
	wire count, lm, lp, sm;

	mult_control inst(count, lm, lp, sm, clk, start, done);
	
	always
		begin 
			#100 clk = ~clk;
		end
		
	initial 
		begin 
			clk = 1'b0;
			start = 1'b0;
			done = 1'b0;
			
	
		#100 
			start = 1'b1;
			
		#1500 
			done = 1'b1;
			
		end
		
		initial begin
		$monitor("time = %2d\n clk = %1b\n start = %1b\n done = %1b\n count = %1b\n lm = %1b\n lp = %1b\n sm = %1b \n\n",
				$time, clk, start, done, count, lm, lp, sm);
		end
	
endmodule
