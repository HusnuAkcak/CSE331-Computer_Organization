module mips_control(reg_dest, branch_eq, branch_not_eq, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write, opcode);
	
	input [3:0] opcode;
	output reg_dest, branch_eq, branch_not_eq, mem_read, mem_to_reg, mem_write, alu_src, reg_write;
	output [2:0] alu_op;
	
	wire op3_not, op2_not, op1_not, op0_not;
	not not3(op3_not, opcode[3]);
	not not2(op2_not, opcode[2]);
	not not1(op1_not, opcode[1]);
	not not0(op0_not, opcode[0]);
	
	//REG_DEST = (op3+op2+op1+op0)’
	nor nor_1(reg_dest, opcode[3], opcode[2], opcode[1], opcode[0]);
	
	//BRANCH_eq = (op2 op1’ op0)
	and and_br_0(branch_eq, opcode[2], op1_not, opcode[0]);
	
	//BRANCH_not_eq = (op2 op1 op0’)
	and and_br_1(branch_not_eq, opcode[2], opcode[1], op0_not);
	
	//MEM_READ op3 op2’ op1’ op0’
	and and_mem_read(mem_read, opcode[3], op2_not, op1_not, op0_not);
	
	//MEM_TO_REG 
	and and_mem_to_reg(mem_to_reg, opcode[3], op2_not, op1_not, op0_not);
	
	//ALU_OP_2 (op3’ op2’ op1 op0’)+(op3’ op2 op1’ op0’)+(op3’ op2 op1 op0)
	wire and_alu2_out1, and_alu2_out2, and_alu2_out3;
	and and1_alu2(and_alu2_out1, op3_not, op2_not, opcode[1], op0_not);
	and and2_alu2(and_alu2_out2, op3_not, opcode[2], op1_not, op0_not);
	and and3_alu2(and_alu2_out3, op3_not, opcode[2], opcode[1], opcode[0]);
	
	or or_alu2(alu_op[2], and_alu2_out1, and_alu2_out2, and_alu2_out3);
	
	//ALU_OP_1 (op3’ op2’ op1 op0’)+(op3’ op2’ op1 op0)+(op3’ op2 op1’ op0)+(op3’ op2 op1 op0’)+(op3’ op2 op1 op0)
	wire and_alu1_out1, and_alu1_out2, and_alu1_out3, and_alu1_out4, and_alu1_out5;
	and and1_alu1(and_alu1_out1, op3_not, op2_not, opcode[1], op0_not);
	and and2_alu1(and_alu1_out2, op3_not, op2_not, opcode[1], opcode[0]);
	and and3_alu1(and_alu1_out3, op3_not, opcode[2], op1_not, opcode[0]);
	and and4_alu1(and_alu1_out4, op3_not, opcode[2], opcode[1], op0_not);
	and and5_alu1(and_alu1_out5, op3_not, opcode[2], opcode[1], opcode[0]);
	
	or or_alu1(alu_op[1], and_alu1_out1, and_alu1_out2, and_alu1_out3, and_alu1_out4, and_alu1_out5);
	
	//ALU_OP_0 (op3’ op2’ op1’ op0)+(op3’ op2’ op1 op0)+(op3’ op2 op1 op0)+(op3 op2’ op1’ op0’)+(op3 op2’ op1’ op0)
	wire and_alu0_out1, and_alu0_out2, and_alu0_out3, and_alu0_out4, and_alu0_out5;
	and and1_alu0(and_alu0_out1, op3_not, op2_not, op1_not, opcode[0]);
	and and2_alu0(and_alu0_out2, op3_not, op2_not, opcode[1], opcode[0]);
	and and3_alu0(and_alu0_out3, op3_not, opcode[2], opcode[1], opcode[0]);
	and and4_alu0(and_alu0_out4, opcode[3], op2_not, op1_not, op0_not);
	and and5_alu0(and_alu0_out5, opcode[3], op2_not, op1_not, opcode[0]);
	
	or or_alu0(alu_op[0], and_alu0_out1, and_alu0_out2, and_alu0_out3, and_alu0_out4, and_alu0_out5);
	
	//MEM_WRITE op3 op2’ op1’ op0
	and and_mem_write(mem_write, opcode[3], op2_not, op1_not, opcode[0]);
	
	//ALU_SRC ((op3+op2+op1+op0)+(op2 op1’ op0)+(op2 op1 op0’))’
	wire or_alusrc0_out, or_alusrc1_out, not_alusrc_out;
	or or_alu_src0(or_alusrc0_out, opcode[3], opcode[2], opcode[1], opcode[0]);
	not not_alu_src0(not_alusrc0_out, or_alusrc0_out);
	or or_alu_src1(or_alusrc1_out, branch_eq, branch_not_eq, not_alusrc0_out);
	not not_alu_src1(alu_src, or_alusrc1_out);
	
	//REG_WRITE ((op3’ op2 op1’ op0)+(op3’ op2 op1 op0’) (op3 op2’ op1’ op0) )’
	wire and_regw_out1, and_regw_out2, and_regw_out3, or_regw_out;
	and and1_regw(and_regw_out1, op3_not, opcode[2], op1_not, opcode[0]);
	and and2_regw(and_regw_out2, op3_not, opcode[2], opcode[1], op0_not);
	and and3_regw(and_regw_out3, opcode[3], op2_not, op1_not, opcode[0]);
	or or_regw(or_regw_out, and_regw_out1, and_regw_out2, and_regw_out3);
	not not_regw(reg_write, or_regw_out);
	
endmodule
	