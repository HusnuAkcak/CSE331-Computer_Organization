module shift_right(R, shifted_lsb, A, new_msb);

input [31:0] A;
input new_msb;
output [31:0] R;
output shifted_lsb;

	or or0(shifted_lsb, 1'b0, A[0]);
	
	xor g31(R[31], new_msb, 1'b0);
	xor g30(R[30], A[31], 1'b0);
	xor g29(R[29], A[30], 1'b0);
	xor g28(R[28], A[29], 1'b0);
	xor g27(R[27], A[28], 1'b0);
	xor g26(R[26], A[27], 1'b0);
	xor g25(R[25], A[26], 1'b0);
	xor g24(R[24], A[25], 1'b0);
	xor g23(R[23], A[24], 1'b0);
	xor g22(R[22], A[23], 1'b0);
	xor g21(R[21], A[22], 1'b0);
	xor g20(R[20], A[21], 1'b0);
	xor g19(R[19], A[20], 1'b0);
	xor g18(R[18], A[19], 1'b0);
	xor g17(R[17], A[18], 1'b0);
	xor g16(R[16], A[17], 1'b0);
	xor g15(R[15], A[16], 1'b0);
	xor g14(R[14], A[15], 1'b0);
	xor g13(R[13], A[14], 1'b0);
	xor g12(R[12], A[13], 1'b0);
	xor g11(R[11], A[12], 1'b0);
	xor g10(R[10], A[11], 1'b0);
	xor g9 (R[9],  A[10], 1'b0);
	xor g8 (R[8],  A[9],  1'b0);
	xor g7 (R[7],  A[8],  1'b0);
	xor g6 (R[6],  A[7],  1'b0);
	xor g5 (R[5],  A[6],  1'b0);
	xor g4 (R[4],  A[5],  1'b0);
	xor g3 (R[3],  A[4],  1'b0);
	xor g2 (R[2],  A[3],  1'b0);
	xor g1 (R[1],  A[2],  1'b0);
	xor g0 (R[0],  A[1],  1'b0);
					 			

endmodule 
