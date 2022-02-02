`timescale 1 ps / 1 ps
module xor_32_tb();

	reg [31:0] A;
	reg [31:0] B;
	wire [31:0] R;

	reg clk;

	xor_32 xor_32_inst(R, A, B);
	
	always
		begin 
			#1 clk = ~clk;
		end
		
	initial 
		begin 
			A = 32'b11111111111111110000000000000000;
			B = 32'b00000000000000001111111111111111;
	
		#100 A = 32'b11111111111111111111111111111111;
			 B = 32'b00000000000000000000000000000000;
		
		#100 A = 32'b11111111111111111111111111111111;
			 B = 32'b00000000000000001111111111111111;
		end

		initial begin
		$monitor("time = %2d\n A = %32b\n B = %32b\n R = %32b \n\n",
				$time, A, B, R);
		end
		
endmodule
