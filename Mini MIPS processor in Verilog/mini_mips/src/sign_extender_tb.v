module sign_extender_tb();

	wire [31:0] ext;
	reg [5:0] imm;
		
	sign_extender s0(ext, imm);
	
	initial
	begin 
		imm = 6'b000111;
		
	#100 imm = 6'b111111;
	#100 imm = 6'b011111;
	#100 imm = 6'b000001;
	
	end 
	
	initial 
	begin 
		$monitor("time: %2d\t imm: %6b\t ext: %32b\n", $time, imm, ext);
	end
	
endmodule 
