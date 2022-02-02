module sign_extender(extended, imm);

	output [31:0] extended;
	input [5:0] imm;
	
	buf buf31(extended[31], imm[5]);
	buf buf30(extended[30], imm[5]);
	buf buf29(extended[29], imm[5]);
	buf buf28(extended[28], imm[5]);
	buf buf27(extended[27], imm[5]);
	buf buf26(extended[26], imm[5]);
	buf buf25(extended[25], imm[5]);
	buf buf24(extended[24], imm[5]);
	buf buf23(extended[23], imm[5]);
	buf buf22(extended[22], imm[5]);
	buf buf21(extended[21], imm[5]);
	buf buf20(extended[20], imm[5]);
	buf buf19(extended[19], imm[5]);
	buf buf18(extended[18], imm[5]);
	buf buf17(extended[17], imm[5]);
	buf buf16(extended[16], imm[5]);
	buf buf15(extended[15], imm[5]);
	buf buf14(extended[14], imm[5]);
	buf buf13(extended[13], imm[5]);
	buf buf12(extended[12], imm[5]);
	buf buf11(extended[11], imm[5]);
	buf buf10(extended[10], imm[5]);
	buf buf9 (extended[9],  imm[5]);
	buf buf8 (extended[8],  imm[5]);
	buf buf7 (extended[7],  imm[5]);
	buf buf6 (extended[6],  imm[5]);
	buf buf5 (extended[5],  imm[5]);
	buf buf4 (extended[4],  imm[4]);
	buf buf3 (extended[3],  imm[3]);
	buf buf2 (extended[2],  imm[2]);
	buf buf1 (extended[1],  imm[1]);
	buf buf0 (extended[0],  imm[0]);
	
endmodule 
	