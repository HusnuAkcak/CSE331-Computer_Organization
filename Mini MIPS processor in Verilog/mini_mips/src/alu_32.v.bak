module alu_32(R, C_O, ALU_OP, A, B, C_I);

output [31:0] R;
output C_O;
input [2:0] ALU_OP; 
input [31:0] A, B;
input C_I;

	wire [31:0] add_res , 
					xor_res , 
					sub_res , 
					mult_res, 
					slt_res , 
					nor_res , 
					and_res , 
					or_res;
	
	full_adder_32 add0(add_res, C_O, A, B, C_I);	// ADD ALU_OP = 000			
	xor_32 xor0(xor_res, A, B);				// XOR ALU_OP = 001	
	sub_32 sub0(sub_res, A, B);				// SUB ALU_OP = 010		
	//mult_32 mult0(mult_res, A, B);			// MULT ALU_OP = 011			
	slt_32 slt0(slt_res, A, B);				// SLT ALU_OP = 100		
	nor_32 nor0(nor_res, A, B);				// NOR ALU_OP = 101		
	and_32 and0(and_res, A, B);				// AND ALU_OP = 110				
	or_32 or0(or_res, A, B);					// OR ALU_OP = 111	
	
	
	mux_8_1 m31(R[31], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[31], xor_res[31], sub_res[31], mult_res[31], slt_res[31], nor_res[31], and_res[31], or_res[31]);
	mux_8_1 m30(R[30], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[30], xor_res[30], sub_res[30], mult_res[30], slt_res[30], nor_res[30], and_res[30], or_res[30]);
	mux_8_1 m29(R[29], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[29], xor_res[29], sub_res[29], mult_res[29], slt_res[29], nor_res[29], and_res[29], or_res[29]);
	mux_8_1 m28(R[28], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[28], xor_res[28], sub_res[28], mult_res[28], slt_res[28], nor_res[28], and_res[28], or_res[28]);
	mux_8_1 m27(R[27], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[27], xor_res[27], sub_res[27], mult_res[27], slt_res[27], nor_res[27], and_res[27], or_res[27]);
	mux_8_1 m26(R[26], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[26], xor_res[26], sub_res[26], mult_res[26], slt_res[26], nor_res[26], and_res[26], or_res[26]);
	mux_8_1 m25(R[25], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[25], xor_res[25], sub_res[25], mult_res[25], slt_res[25], nor_res[25], and_res[25], or_res[25]);
	mux_8_1 m24(R[24], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[24], xor_res[24], sub_res[24], mult_res[24], slt_res[24], nor_res[24], and_res[24], or_res[24]);
	mux_8_1 m23(R[23], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[23], xor_res[23], sub_res[23], mult_res[23], slt_res[23], nor_res[23], and_res[23], or_res[23]);
	mux_8_1 m22(R[22], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[22], xor_res[22], sub_res[22], mult_res[22], slt_res[22], nor_res[22], and_res[22], or_res[22]);
	mux_8_1 m21(R[21], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[21], xor_res[21], sub_res[21], mult_res[21], slt_res[21], nor_res[21], and_res[21], or_res[21]);
	mux_8_1 m20(R[20], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[20], xor_res[20], sub_res[20], mult_res[20], slt_res[20], nor_res[20], and_res[20], or_res[20]);
	mux_8_1 m19(R[19], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[19], xor_res[19], sub_res[19], mult_res[19], slt_res[19], nor_res[19], and_res[19], or_res[19]);
	mux_8_1 m18(R[18], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[18], xor_res[18], sub_res[18], mult_res[18], slt_res[18], nor_res[18], and_res[18], or_res[18]);
	mux_8_1 m17(R[17], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[17], xor_res[17], sub_res[17], mult_res[17], slt_res[17], nor_res[17], and_res[17], or_res[17]);
	mux_8_1 m16(R[16], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[16], xor_res[16], sub_res[16], mult_res[16], slt_res[16], nor_res[16], and_res[16], or_res[16]);
	mux_8_1 m15(R[15], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[15], xor_res[15], sub_res[15], mult_res[15], slt_res[15], nor_res[15], and_res[15], or_res[15]);
	mux_8_1 m14(R[14], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[14], xor_res[14], sub_res[14], mult_res[14], slt_res[14], nor_res[14], and_res[14], or_res[14]);
	mux_8_1 m13(R[13], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[13], xor_res[13], sub_res[13], mult_res[13], slt_res[13], nor_res[13], and_res[13], or_res[13]);
	mux_8_1 m12(R[12], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[12], xor_res[12], sub_res[12], mult_res[12], slt_res[12], nor_res[12], and_res[12], or_res[12]);
	mux_8_1 m11(R[11], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[11], xor_res[11], sub_res[11], mult_res[11], slt_res[11], nor_res[11], and_res[11], or_res[11]);
	mux_8_1 m10(R[10], ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[10], xor_res[10], sub_res[10], mult_res[10], slt_res[10], nor_res[10], and_res[10], or_res[10]);
	mux_8_1 m9( R[9],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[9],  xor_res[9],  sub_res[9],  mult_res[9],  slt_res[9],  nor_res[9],  and_res[9],  or_res[9] );
	mux_8_1 m8( R[8],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[8],  xor_res[8],  sub_res[8],  mult_res[8],  slt_res[8],  nor_res[8],  and_res[8],  or_res[8] );
	mux_8_1 m7( R[7],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[7],  xor_res[7],  sub_res[7],  mult_res[7],  slt_res[7],  nor_res[7],  and_res[7],  or_res[7] );
	mux_8_1 m6( R[6],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[6],  xor_res[6],  sub_res[6],  mult_res[6],  slt_res[6],  nor_res[6],  and_res[6],  or_res[6] );
	mux_8_1 m5( R[5],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[5],  xor_res[5],  sub_res[5],  mult_res[5],  slt_res[5],  nor_res[5],  and_res[5],  or_res[5] );
	mux_8_1 m4( R[4],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[4],  xor_res[4],  sub_res[4],  mult_res[4],  slt_res[4],  nor_res[4],  and_res[4],  or_res[4] );
	mux_8_1 m3( R[3],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[3],  xor_res[3],  sub_res[3],  mult_res[3],  slt_res[3],  nor_res[3],  and_res[3],  or_res[3] );
	mux_8_1 m2( R[2],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[2],  xor_res[2],  sub_res[2],  mult_res[2],  slt_res[2],  nor_res[2],  and_res[2],  or_res[2] );
	mux_8_1 m1( R[1],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[1],  xor_res[1],  sub_res[1],  mult_res[1],  slt_res[1],  nor_res[1],  and_res[1],  or_res[1] );
	mux_8_1 m0( R[0],  ALU_OP[0], ALU_OP[1], ALU_OP[2], add_res[0],  xor_res[0],  sub_res[0],  mult_res[0],  slt_res[0],  nor_res[0],  and_res[0],  or_res[0] );

endmodule 