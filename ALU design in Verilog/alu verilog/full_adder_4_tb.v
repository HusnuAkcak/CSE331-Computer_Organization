`timescale 1 ps / 1 ps
module full_adder_4_tb();

	reg [3:0] A, B;
	reg C_I;
	wire [3:0] S;
	wire C_O;

	reg clk;

	full_adder_4 full_adder_4_inst(S, C_O, A, B, C_I);
	
	always
		begin 
			#1 clk = ~clk;
		end
		
	initial 
		begin 
			A = 4'b0000;
			B = 4'b0000;
			C_I = 1'b0;
	
		#100 
			A = 4'b0000;
			B = 4'b0000;
			C_I = 1'b1;

		#100 
			A = 4'b0101;
			B = 4'b0111;
			C_I = 1'b0;
			
		#100 
			A = 4'b0100;
			B = 4'b0011;
			C_I = 1'b1;
			
		#100 
			A = 4'b0000;
			B = 4'b0011;
			C_I = 1'b0;
			
		#100 
			A = 4'b0101;
			B = 4'b0011;
			C_I = 1'b1;
			
		#100 
			A = 4'b1111;
			B = 4'b0011;
			C_I = 1'b0;
			
		#100 
			A = 4'b1111;
			B = 4'b1111;
			C_I = 1'b1;
			
		end
	
endmodule
