module mips_instruction_memory_tb();

	wire [15:0] instruction;
	reg [31:0] read_address;

	mips_instruction_memory mem_inst(instruction, read_address);

		
	initial 
		begin 
			read_address <= 32'b00000000000000000000000000000000; 
			
		#100
			read_address <= 32'b00000000000000000000000000000001; 

		#100
			read_address <= 32'b00000000000000000000000000000010; 
		
		#100 
			read_address <= 32'b00000000000000000000000000000011; 
			
		#100
			read_address <= 32'b00000000000000000000000000000100; 
			
		#100
			read_address <= 32'b00000000000000000000000000000101; 

		#100
			read_address <= 32'b00000000000000000000000000000110; 
		
		#100 
			read_address <= 32'b00000000000000000000000000000111; 
			
		#100
			read_address <= 32'b00000000000000000000000000001000; 
			
		#100
			read_address <= 32'b00000000000000000000000000001001; 

		#100
			read_address <= 32'b00000000000000000000000000001010; 
		
		#100 
			read_address <= 32'b00000000000000000000000000001011; 
			
		#100
			read_address <= 32'b00000000000000000000000000001100; 
			
		#100
			read_address <= 32'b00000000000000000000000000001101; 

		#100
			read_address <= 32'b00000000000000000000000000001110; 
		
		end
		
		initial begin
			$monitor("time = %2d\n read_address = %32b\n instruction = %15b\n  \n\n",
				$time, read_address, instruction);
		end
		
endmodule
	