module nor_32(R, A, B);

	input [31:0] A, B;
	output [31:0] R;

	
	nor g31( R[31], A[31], B[31]);
	nor g30( R[30], A[30], B[30]);
	nor g29( R[29], A[29], B[29]);
	nor g28( R[28], A[28], B[28]);
	nor g27( R[27], A[27], B[27]);
	nor g26( R[26], A[26], B[26]);
	nor g25( R[25], A[25], B[25]);
	nor g24( R[24], A[24], B[24]);
	nor g23( R[23], A[23], B[23]);
	nor g22( R[22], A[22], B[22]);
	nor g21( R[21], A[21], B[21]);
	nor g20( R[20], A[20], B[20]);
	nor g19( R[19], A[19], B[19]);
	nor g18( R[18], A[18], B[18]);
	nor g17( R[17], A[17], B[17]);
	nor g16( R[16], A[16], B[16]);
	nor g15( R[15], A[15], B[15]);
	nor g14( R[14], A[14], B[14]);
	nor g13( R[13], A[13], B[13]);
	nor g12( R[12], A[12], B[12]);
	nor g11( R[11], A[11], B[11]);
	nor g10( R[10], A[10], B[10]);
	nor g9( R[9], A[9], B[9]);
	nor g8( R[8], A[8], B[8]);
	nor g7( R[7], A[7], B[7]);
	nor g6( R[6], A[6], B[6]);
	nor g5( R[5], A[5], B[5]);
	nor g4( R[4], A[4], B[4]);
	nor g3( R[3], A[3], B[3]);
	nor g2( R[2], A[2], B[2]);
	nor g1( R[1], A[1], B[1]);
	nor g0( R[0], A[0], B[0]);
	
endmodule
