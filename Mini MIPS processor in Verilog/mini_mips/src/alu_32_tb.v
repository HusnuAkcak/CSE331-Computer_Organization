`timescale 1 ps / 1 ps
module alu_32_tb();

	reg [31:0] A, B;
	reg [2:0] ALU_OP;
	reg C_I;
	wire [31:0] R;
	wire C_O, ZERO;
	
	reg clk;
	
	
	// ADD ALU_OP = 000	
	// XOR ALU_OP = 001	
	// SUB ALU_OP = 010	
	// MULT ALU_OP = 011	
	// STL ALU_OP = 100	
	// NOR ALU_OP = 101	
	// AND ALU_OP = 110	
	// OR ALU_OP = 111	
	alu_32 alu_32_inst(R, C_O, ZERO, ALU_OP, A, B, C_I);
	
	always
		begin 
			#1 clk = ~clk;
		end
		
	initial 
		begin 
			ALU_OP = 3'b000; // add
			A = 32'b11000011111111110000000000000000;
			B = 32'b00000000000000001111111111111111;
			C_I = 1'b1;
			
		#100
			A = 32'b00000000000000000000000000000101; //5
			B = 32'b00000000000000000000000000001001; //9
			C_I = 1'b0;
		
		#100
			ALU_OP = 3'b001; // xor
			A = 32'b11111111111111110000000000000000;
			B = 32'b10000000000000010111111111111110;
		
		#100
			A = 32'b11111111000000000000000000000000;
			B = 32'b11000000000000011111111111111110;
	
		#100
			ALU_OP = 3'b010; // sub
			A = 32'b00000000000000000000000000000101; // 5
			B = 32'b11111111111111111111111111111101;	// -3		 
			// 5-(-3) => 8 => 32'b00000000000000000000000000001000
		
		#100 
			A = 32'b00000000000000000000000000000101; //5
			B = 32'b00000000000000000000000000000101; //5
			
		// MULT ALU_OP = 011	
		
		#100 
			ALU_OP = 3'b100; // slt
			A = 32'b11111111111111111111111111111101;	// -3		
			B = 32'b11111111111111111111111111111100; // -4 
		
		#100 
			A = 32'b11111111111111111111111111111100; // -4	
			B = 32'b11111111111111111111111111111101;	// -3		
			
		#100 
			ALU_OP = 3'b101; // nor	
			A = 32'b00111111111111111111111111111100;
			B = 32'b00000000000000000000000000000000;
		
		#100
			A = 32'b00111111111111110000111101010100;
			B = 32'b00000000001111111100000000000000;
		
		#100 
			ALU_OP = 3'b110; // and 
			A = 32'b11111111111111111111111111111111;
			B = 32'b00000000000000001111111111111111;
		
		#100
			A = 32'b11001111111111111111111111111111;
			B = 32'b11000000000000001111111111111111;
			 
		 #100 
			ALU_OP = 3'b111; // or
			A = 32'b11111111111111111111111111111111;
			B = 32'b00000000000000001111111111111111;
			
		#100
			A = 32'b00011111111000001111111111111111;
			B = 32'b00000000000000001111111111111111;
		
		end
		
		initial begin
	$monitor("time = %2d\n ALUOp = %3b\n A = %32b\n B = %32b\n R = %32b\n Cin = %1b\n Cout = %1b\n ZERO = %1b\n",
				$time, ALU_OP, A, B, R, C_I, C_O, ZERO);
		end
		
endmodule
	