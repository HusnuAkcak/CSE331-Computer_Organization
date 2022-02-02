module instruction_decoder_tb();

	wire [3:0]opcode;
	wire [2:0] rs, rt, rd, func;
	wire [5:0] imm;
	reg  [15:0] instruction;

	instruction_decoder id(opcode, rs, rt, rd, func, imm, instruction);


	initial 
	begin 
		instruction <= 16'b0000000001010000; 
		
	#100
		instruction <= 16'b0000001010011001; 

	#100
		instruction <= 16'b0000010011100010;  
	
	#100 
		instruction <= 16'b0000011100101011; 
		
	
	end
	
	initial begin
		$monitor("time = %2d\n instruction = %16b\n opcode = %4b\n rs = %3b\n rt = %3b\n rd = %3b\n func = %3b\n imm = %6b\n  \n\n",
			$time, instruction, opcode, rs, rt, rd, func, imm);
	end
endmodule 
