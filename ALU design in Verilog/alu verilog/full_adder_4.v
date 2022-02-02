module full_adder_4(S, C_O, A, B, C_I);

input [3:0] A, B;
input C_I;
output [3:0] S;
output C_O;

	wire [2:0] in_c_o; // wires for inner carry out/in

	full_adder fa0(S[0], in_c_o[0], A[0], B[0], C_I);
	full_adder fa1(S[1], in_c_o[1], A[1], B[1], in_c_o[0]);
	full_adder fa2(S[2], in_c_o[2], A[2], B[2], in_c_o[1]);
	full_adder fa3(S[3], C_O, 		  A[3], B[3], in_c_o[2]);


endmodule 