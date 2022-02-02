module mips_alu_control(alu_control, alu_op, func);

	output [2:0] alu_control;
	input [2:0] alu_op, func;
	
	
	wire f2_not, f1_not, f0_not, aluop2_not, aluop1_not, aluop0_not;
	
	not not0(f0_not, func[0]);
	not not1(f1_not, func[1]);
	not not2(f2_not, func[2]);
	
	not not10(aluop0_not, alu_op[0]);
	not not11(aluop1_not, alu_op[1]);
	not not12(aluop2_not, alu_op[2]);

	// alu selection bits
	// ALU CONTROL 2 = ((a2’ a1’ a0’) ((f2’ f1’ f0’) + (f2 f1’ f0’) + (f2 f1’ f0))) + (a2 a1 a0’) + (a2’ a1 a0)+ (a2 a1’ a0’) + (a2 a1 a0)
	wire and0_out, and1_out, and2_out, and3_out, and4_out, and5_out, and6_out, and7_out, and8_out;
	wire or0_out;
	
	and and0(and0_out, aluop2_not, aluop1_not, aluop0_not);
	and and1(and1_out, f2_not, f1_not, f0_not);
	and and2(and2_out, func[2], f1_not, f0_not);
	and and3(and3_out, func[2], f1_not, func[0]);
	and and4(and4_out, alu_op[2], alu_op[1], aluop0_not);
	and and5(and5_out, aluop2_not, alu_op[1], alu_op[0]);
	and and6(and6_out, alu_op[2], aluop1_not, aluop0_not);
	and and7(and7_out, alu_op[2], alu_op[1], alu_op[0]);
	or or0(or0_out, and1_out, and2_out, and3_out);
	and and8(and8_out, and0_out, or0_out);
	or or1(alu_control[2], and4_out, and5_out, and6_out, and7_out, and8_out);
	
	// ALU CONTROL 1 = ((a2’ a1’ a0’) ((f2’ f1’ f0’) + (f2’ f1 f0’) + (f2 f1’ f0))) + (a2 a1 a0’) + (a2’ a1 a0) + (a2’ a1 a0’)
	wire and10_out, and11_out, and12_out, and13_out, and14_out, and15_out, and16_out, and17_out;
	wire or10_out;
	
	and and10(and10_out, aluop2_not, aluop1_not, aluop0_not);
	and and11(and11_out, f2_not, f1_not, f0_not);
	and and12(and12_out, f2_not, func[1], f0_not);
	and and13(and13_out, func[2], f1_not, func[0]);
	and and14(and14_out, alu_op[2], alu_op[1], aluop0_not);
	and and15(and15_out, aluop2_not, alu_op[1], alu_op[0]);
	and and17(and17_out, aluop2_not, alu_op[1], aluop0_not);
	or or10(or10_out, and11_out, and12_out, and13_out);
	and and16(and16_out, or10_out, and10_out);
	or or11(alu_control[1], and14_out, and15_out, and16_out, and17_out);
	
	
	// ALU CONTROL 0 = ((a2’ a1’ a0’) ((f2’ f1 f0) + (f2 f1’ f0’) + (f2 f1’ f0))) + (a2’ a1 a0) + (a2 a1’ a0’)
	wire and20_out, and21_out, and22_out, and23_out, and24_out, and25_out, and26_out;
	wire or20_out;
	
	and and20(and20_out, aluop2_not, aluop1_not, aluop0_not);
	and and21(and21_out, f2_not, func[1], func[0]);
	and and22(and22_out, func[2], f1_not, f0_not);
	and and23(and23_out, func[2], f1_not, func[0]);
	and and24(and24_out, aluop2_not, alu_op[1], alu_op[0]);
	and and25(and25_out, alu_op[2], aluop1_not, aluop0_not);
	or or20(or20_out, and21_out, and22_out, and23_out);
	and and26(and26_out, or20_out, and20_out);
	or or21(alu_control[0], and24_out, and25_out, and26_out);
	
endmodule 
