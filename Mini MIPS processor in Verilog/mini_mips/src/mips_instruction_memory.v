module mips_instruction_memory(instruction, read_address);

	output [15:0] instruction;
	input [31:0] read_address;
	
	reg [15:0] instructions [255:0]; // for the demo instruction memory length is set 300 instead of 2^32
	
	initial 
	begin 
		$readmemb("instruction_memory.mem", instructions);
	end
	
	buf buf15(instruction [15], instructions[read_address][15]);
	buf buf14(instruction [14], instructions[read_address][14]);
	buf buf13(instruction [13], instructions[read_address][13]);
	buf buf12(instruction [12], instructions[read_address][12]);
	buf buf11(instruction [11], instructions[read_address][11]);
	buf buf10(instruction [10], instructions[read_address][10]);
	buf buf9 (instruction [9 ], instructions[read_address][9 ]);
	buf buf8 (instruction [8 ], instructions[read_address][8 ]);
	buf buf7 (instruction [7 ], instructions[read_address][7 ]);
	buf buf6 (instruction [6 ], instructions[read_address][6 ]);
	buf buf5 (instruction [5 ], instructions[read_address][5 ]);
	buf buf4 (instruction [4 ], instructions[read_address][4 ]);
	buf buf3 (instruction [3 ], instructions[read_address][3 ]);
	buf buf2 (instruction [2 ], instructions[read_address][2 ]);
	buf buf1 (instruction [1 ], instructions[read_address][1 ]);
	buf buf0 (instruction [0 ], instructions[read_address][0 ]);
	
endmodule
