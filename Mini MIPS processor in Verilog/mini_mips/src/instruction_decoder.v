module instruction_decoder(opcode, rs, rt, rd, func, imm, instruction);

	input [15:0] instruction;
	output [3:0]opcode;
	output [2:0] rs, rt, rd, func;
	output [5:0] imm;
	
	
	buf buf15(opcode[3], instruction[15]);
	buf buf14(opcode[2], instruction[14]);
	buf buf13(opcode[1], instruction[13]);
	buf buf12(opcode[0], instruction[12]);
	buf buf11(rs[2], 	instruction[11]);
	buf buf10(rs[1], 	instruction[10]);
	buf buf9 (rs[0], 	instruction[9]);
	buf buf8 (rt[2], 	instruction[8]);
	buf buf7 (rt[1], 	instruction[7]);
	buf buf6 (rt[0], 	instruction[6]);
	buf buf5 (rd[2], 	instruction[5]);
	buf buf4 (rd[1], 	instruction[4]);
	buf buf3 (rd[0], 	instruction[3]);
	buf buf2 (func[2],instruction[2]);
	buf buf1 (func[1],instruction[1]);
	buf buf0 (func[0],instruction[0]);
	buf buf25 (imm[5], instruction[5]);
	buf buf24 (imm[4], instruction[4]);
	buf buf23 (imm[3], instruction[3]);
	buf buf22 (imm[2], instruction[2]);
	buf buf21 (imm[1], instruction[1]);
	buf buf20 (imm[0], instruction[0]);
	
	
endmodule 
