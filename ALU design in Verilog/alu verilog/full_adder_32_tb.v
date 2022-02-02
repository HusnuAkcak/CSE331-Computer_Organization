`timescale 1 ps / 1 ps
module full_adder_32_tb();

	reg [31:0] A, B;
	reg C_I;
	wire [31:0] R;
	wire C_O;

	reg clk;

	full_adder_32 full_adder_32_inst(R, C_O, A, B, C_I);
	
	always
		begin 
			#1 clk = ~clk;
		end
		
	initial 
		begin 
			A = 32'b00000000000000000000000000000001;
			B = 32'b11000000000000000000000000000000;
			C_I = 1'b0;
			
		 #100 
			A = 32'b00000000000000001111111111111111;
			B = 32'b00000000000000001111111111111111;
			C_I = 1'b0;
	
		#100 
			A = 32'b11111111111111111111111111111111;
			B = 32'b00000000000000001111111111111111;			 
			C_I = 1'b1;

		#100 
			A = 32'b11111111110001111111111111111111;
			B = 32'b00000000111100111100000000000000;
			C_I = 1'b0;
			
		#100 
			A = 32'b11000011111111110000000000000000;
			B = 32'b00000000000000001111111111111111;
			C_I = 1'b1;
			
		#100 
			A = 32'b11111100011111110000110000000000;
			B = 32'b00000000000000001111111111111111;
			C_I = 1'b0;

		#100 
			A = 32'b11111111111111110000000011000000;
			B = 32'b00000000111100001111111111111111;		
			C_I = 1'b1;
			
		#100 
			A = 32'b11111111111111110000000000000000;
			B = 32'b00000000000000001111111111111111;
			C_I = 1'b0;
			
		#100 
			A = 32'b11111111111111110000000000000000;
			B = 32'b00001111000000001111111111111111;
			C_I = 1'b1;
			
		end

		initial begin
	$monitor("time = %2d\n A = %32b\n B = %32b\n R = %32b\n Cin = %1b\n Cout = %1b\n\n",
				$time, A, B, R, C_I, C_O);
		end
		
endmodule
