module MiniMIPS_testbench ();

	reg pc_clk, datapath_clk;
	reg [31:0] pc_new;
	wire [31:0] pc_next;
	MiniMIPS d(pc_next, datapath_clk, pc_new);


	initial begin
		//Continue for all instruction types 
		//Must be least 15*2=30 control lines (There must be at least 2 tests for each instruction)
		datapath_clk = 0;
		pc_clk = 0;
		pc_new = 32'b00000000000000000000000000000000;
	
	end
	
	always
	begin 
		#100 pc_clk <= ~pc_clk;
	end
		
	always
	begin 
		#50 datapath_clk <= ~datapath_clk;
	end
	
	always @(posedge pc_clk) 
	begin
			pc_new <= pc_next;
			if (pc_new == 32'b00000000000000000000000000100011)
			begin
				$finish;
			end
	end
	
	always @(negedge pc_clk)
	begin 
		$monitor("time= %2d\n pc_new=%32b\n opcode=%4b\t rs=%3b\t rt=%3b\t rd=%3b\t func=%3b\n reg_dest=%1b\t branch_eq=%1b\t branch_not_eq=%1b\t mem_read=%1b\t mem_to_reg=%1b\t mem_write=%1b\t alu_src=%1b\t reg_write=%1b\t write_reg=%3b\t write_data=%32b\n read_data_1=%32b\t read_data_2=%32b\t extended_imm=%32b\n mem_read_data=%32b\t alu_control=%3b\t alu_res=%32b\n",
					$time, d.pc_new, d.opcode, d.rs, d.rt, d.rd, d.func, 
					d.reg_dest, d.branch_eq, d.branch_not_eq, d.mem_read, d.mem_to_reg, d.mem_write, d.alu_src, d.reg_write,
					d.write_reg, d.write_data,
					d.read_data_1, d.read_data_2, d.extended_imm,
					d.mem_read_data, d.alu_control, d.alu_res
		);
	end 


	
endmodule
