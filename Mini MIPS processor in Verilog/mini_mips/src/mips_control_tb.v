`timescale 1 ps / 1 ps
module mips_control_tb();

	reg [3:0] opcode;
	wire reg_dest, branch_eq, branch_not_eq, mem_read, mem_to_reg, mem_write, alu_src, reg_write;
	wire [2:0] alu_op;
	

	mips_control control_inst(reg_dest, branch_eq, branch_not_eq, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write, opcode);
	
	initial	
	begin 
		opcode = 4'b0000;

	#100
		opcode = 4'b0001;
	
	#100
		opcode = 4'b0010;
	
	#100
		opcode = 4'b0011;
	
	#100
		opcode = 4'b0100;
	
	#100
		opcode = 4'b0101;
	
	#100
		opcode = 4'b0110;
			
	#100
		opcode = 4'b0111;
	
	#100
		opcode = 4'b1000;
	
	#100
		opcode = 4'b1001;
		
	end
	
	initial
	begin 
		$monitor("time %2d\n opcode = %4b\n reg_dest = %1b\t branch_eq = %1b\t branch_not_eq = %1b\t mem_read = %1b\t mem_to_reg = %1b\t alu_op = %3b\t mem_write = %1b\t alu_src = %1b\t reg_write = %1b\t ",
			$time, opcode, reg_dest, branch_eq, branch_not_eq, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write
		);
	end
	
endmodule
