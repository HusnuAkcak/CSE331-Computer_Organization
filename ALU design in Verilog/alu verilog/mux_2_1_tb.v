`timescale 1 ps / 1 ps
module mux_2_1_tb();

	reg S, I_0, I_1;
	wire R;

	reg clk;
	
	mux_2_1 mux_2_1_inst(R, S, I_0, I_1);
	
	always
		begin 
			#1 clk = ~clk;
		end
		
	initial 
		begin 
			S = 0;
			I_0 = 1;
			I_1 = 0;
			
			#100 S = 1;
			
			#100 S = 0;
			
			#100 S = 1;
		end
	
		
endmodule
