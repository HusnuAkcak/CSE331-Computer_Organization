`timescale 1 ps / 1 ps
module full_adder_tb();

	reg A, B, C_I;
	wire S, C_O;

	reg clk;

	full_adder full_adder_inst(S, C_O, A, B, C_I);
	
	always
		begin 
			#1 clk = ~clk;
		end
		
	initial 
		begin 
			A = 1'b0;
			B = 1'b0;
			C_I = 1'b0;
	
		#100 
			A = 1'b0;
			B = 1'b0;
			C_I = 1'b1;

		#100 
			A = 1'b0;
			B = 1'b1;
			C_I = 1'b0;
			
		#100 
			A = 1'b0;
			B = 1'b1;
			C_I = 1'b1;
			
		#100 
			A = 1'b1;
			B = 1'b0;
			C_I = 1'b0;
			
		#100 
			A = 1'b1;
			B = 1'b0;
			C_I = 1'b1;
			
		#100 
			A = 1'b1;
			B = 1'b1;
			C_I = 1'b0;
			
		#100 
			A = 1'b1;
			B = 1'b1;
			C_I = 1'b1;
			
		end
	
endmodule
