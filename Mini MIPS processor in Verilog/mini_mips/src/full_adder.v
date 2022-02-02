module full_adder(S, C_O, A, B, C_I);

input A, B, C_I;
output S, C_O;

	wire a_and_b, a_xor_b, c_and_a_xor_b;

	and and0(a_and_b, A, B);
	xor xor0(a_xor_b, A, B);
	and and1(c_and_a_xor_b, C_I, a_xor_b);

	xor xor1(S, A, B, C_I);	
	or or0(C_O, a_and_b, c_and_a_xor_b);

endmodule 