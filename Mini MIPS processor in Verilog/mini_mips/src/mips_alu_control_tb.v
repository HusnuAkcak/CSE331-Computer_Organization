module mips_alu_control_tb();

	reg [2:0] alu_op, func;
	wire [2:0] alu_control;
	
	mips_alu_control mips_alu_control_inst(alu_control, alu_op, func);
	
	initial
	begin 
		alu_op= 3'b000;
		func 	= 3'b000;
	#100
		alu_op= 3'b000;
		func 	= 3'b001;
	#100
		alu_op= 3'b000;
		func 	= 3'b010;
	#100
		alu_op= 3'b000;
		func 	= 3'b011;
	#100
		alu_op= 3'b000;
		func 	= 3'b100;	
	#100
		alu_op= 3'b000;
		func 	= 3'b101;	
		
	#100
		alu_op= 3'b001;
		func 	= 3'bxxx;	
	#100
		alu_op= 3'b110;
	#100
		alu_op= 3'b011;
	#100
		alu_op= 3'b100;
	#100
		alu_op= 3'b010;
	#100
		alu_op= 3'b010;
	#100	
		alu_op= 3'b111;
	#100	
		alu_op= 3'b001;
	#100
		alu_op= 3'b001;
		
	end
	
	initial
	begin 
		$monitor("time %2d\t fucn = %3b\t alu_op= %3b\t alu_control = %3b ",
			$time, func, alu_op, alu_control
		);
	end
	
endmodule
