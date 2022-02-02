module full_adder_32(S, C_O, A, B, C_I);

input [31:0] A, B;
input C_I;
output [31:0] S;
output C_O;

	wire [6:0] in_c_o; // wires for inner carry out/in

	full_adder_4 fa0(S[3:0],   in_c_o[0], A[3:0],   B[3:0],   C_I);
	full_adder_4 fa1(S[7:4],   in_c_o[1], A[7:4],   B[7:4],   in_c_o[0]);
	full_adder_4 fa2(S[11:8],  in_c_o[2], A[11:8],  B[11:8],  in_c_o[1]);
	full_adder_4 fa3(S[15:12], in_c_o[3], A[15:12], B[15:12], in_c_o[2]);
	full_adder_4 fa4(S[19:16], in_c_o[4], A[19:16], B[19:16], in_c_o[3]);
	full_adder_4 fa5(S[23:20], in_c_o[5], A[23:20], B[23:20], in_c_o[4]);
	full_adder_4 fa6(S[27:24], in_c_o[6], A[27:24], B[27:24], in_c_o[5]);
	full_adder_4 fa7(S[31:28], C_O, 		  A[31:28], B[31:28], in_c_o[6]);


endmodule 