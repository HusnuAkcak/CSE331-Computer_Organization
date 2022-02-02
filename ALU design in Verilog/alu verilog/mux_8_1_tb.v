`timescale 1 ps / 1 ps
module mux_8_1_tb();

	reg S_0, S_1, S_2, I_0, I_1, I_2, I_3, I_4, I_5, I_6, I_7;
	wire R;

	reg clk;
	
	mux_8_1 mux_8_1_inst(R, S_0, S_1, S_2, I_0, I_1, I_2, I_3, I_4, I_5, I_6, I_7);
	
	always
		begin 
			#1 clk = ~clk;
		end
		
	initial 
		begin 
			S_2 = 0;
			S_1 = 0;
			S_0 = 0;
			
			
			I_0 = 1;
			I_1 = 0;
			I_2 = 1;
			I_3 = 1;
			I_4 = 1;
			I_5 = 0;
			I_6 = 1;
			I_7 = 1;
			
			#100 
			S_2 = 0;
			S_1 = 0;
			S_0 = 1;
			
			
			#100 
			S_2 = 0;
			S_1 = 1;
			S_0 = 0;
			
			#100
			S_2 = 0;
			S_1 = 1;
			S_0 = 1;
			
			#100 
			S_2 = 1;
			S_1 = 0;
			S_0 = 0;
			
			
			#100 
			S_2 = 1;
			S_1 = 0;
			S_0 = 1;
			
			
			#100 
			S_2 = 1;
			S_1 = 1;
			S_0 = 0;
			
			#100
			S_0 = 1;
			S_1 = 1;
			S_2 = 1;
			
		end
	
endmodule
