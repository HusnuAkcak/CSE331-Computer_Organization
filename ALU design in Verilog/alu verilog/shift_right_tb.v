module shift_right_tb();

	reg [31:0] A, new_msb;
	wire [31:0] R, shifted_lsb;
	
	shift_right g0(R, shifted_lsb, A, new_msb);
	
	initial 
		begin 
			A = 32'b11111111111111110000000000000000;
			new_msb = 1'b0;
	
		#100 
			A = 32'b00011111111111111111111111111111;
			new_msb = 1'b1;
			
		end
		
		initial begin
			$monitor("time = %2d\n A = %32b\n new_msb = %1b\n R = %32b \n shifted_lsb = %1b\n\n", $time, A, new_msb, R, shifted_lsb);
		end
	
endmodule 
