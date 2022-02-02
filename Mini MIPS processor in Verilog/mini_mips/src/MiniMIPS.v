module MiniMIPS(pc_next, clk, pc_new);

	input clk;
	input [31:0] pc_new;
	output [31:0] pc_next;
	
	//this module is a top-level entity
	//all modules in this project that have to use just structural verilog (except register & data modules)
	//MiniMIPS has to work correctly for 15 instruction.
	//alu32 design has to stay same with assignment3

	//Verilog coding guidelines 
	//Guideline #1: When modeling sequential logic, use nonblocking assignments.
	//Guideline #2: When modeling latches, use nonblocking assignments.
	//Guideline #3: When modeling combinational logic with an always block, use blocking assignments.

	// pc calculation
	wire [31:0] pc_plus_one, pc_jump_add, extended_imm;
	wire cout_temp, branch_ok;
	full_adder_32 adder_1(pc_plus_one, cout_temp, pc_new, 32'b00000000000000000000000000000001, 'b0);
	full_adder_32 adder_2(pc_jump_add, cout_temp, pc_plus_one, extended_imm, 'b0);

	// instruction fetch and decode 
	wire [3:0] opcode;
	wire [2:0] rs, rt, rd, func;
	wire [5:0] imm;
	wire [15:0] instruction;
	mips_instruction_memory mim(instruction, pc_new);
	instruction_decoder id(opcode, rs, rt, rd, func, imm, instruction);
	sign_extender se(extended_imm, imm);

	// control
	wire reg_dest, branch_eq, branch_not_eq, mem_read, mem_to_reg, mem_write, alu_src, reg_write;
	wire [2:0] alu_op;
	mips_control mc(reg_dest, branch_eq, branch_not_eq, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write, opcode);

	// registers 
	wire [2:0] write_reg;
	mux_2_1 m2(write_reg[2], reg_dest, rt[2], rd[2]);
	mux_2_1 m1(write_reg[1], reg_dest, rt[1], rd[1]);
	mux_2_1 m0(write_reg[0], reg_dest, rt[0], rd[0]);
	wire [31:0] read_data_1, read_data_2, write_data;
	mips_registers mr(read_data_1, read_data_2, write_data, rs, rt, write_reg, reg_write, clk);
	
	// alu control 
	wire [2:0] alu_control; 
	mips_alu_control mac(alu_control, alu_op, func);

	// alu
	wire [31:0] alu_b, alu_res;
	wire zero, not_zero, branch_eq_ok, branch_not_eq_ok;
	mux32_2_1 m32_1(alu_b, alu_src, read_data_2, extended_imm);
	
	alu_32 a32(alu_res, cout_temp, zero, alu_control, read_data_1, alu_b, 'b0);
	not not_br(not_zero, zero);
	and and_beq(branch_eq_ok, zero, branch_eq);
	and and_bne(branch_not_eq_ok, not_zero, branch_not_eq);
	or or_br(branch_ok, branch_eq_ok, branch_not_eq_ok);

	// data memory
	wire [31:0] mem_read_data;
	mips_data_memory mdm(mem_read_data, alu_res, read_data_2, mem_write, mem_read, clk);
	mux32_2_1 m32_2(write_data, mem_to_reg, alu_res, mem_read_data);

	mux32_2_1 m32_0(pc_next, branch_ok, pc_plus_one, pc_jump_add);

endmodule
