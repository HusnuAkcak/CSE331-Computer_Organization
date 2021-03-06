`timescale 1 ps / 1 ps
module mux_4_1_tb();

	reg S_0, S_1, I_0, I_1, I_2, I_3;
	wire R;

	reg clk;
	
	mux_4_1 mux_4_1_inst(R, S_0, S_1, I_0, I_1, I_2, I_3);
	
	always
		begin 
			#1 clk = ~clk;
		end
		
	initial 
		begin 
			S_0 = 0;
			S_1 = 0;
			
			I_0 = 0;
			I_1 = 1;
			I_2 = 0;
			I_3 = 0;
			
			#100 
			S_0 = 1;
			S_1 = 0;
			
			#100 
			S_0 = 0;
			S_1 = 1;
			
			#100
			S_0 = 1;
			S_1 = 1;
		end
	
endmodule
