module sub_32(R, A, B);

output [31:0] R;
input [31:0] A, B;

	// flip B
	wire [31:0] not_B, ones;
	wire C_O;
	
	xor_32 xor0(not_B, 32'b11111111111111111111111111111111, B);
	full_adder_32 fa1(R, C_O, A, not_B, 1'b1);
	
	

endmodule 
