`timescale 1 ps / 1 ps
module mips_registers_tb();

	wire [31:0] read_data_1, read_data_2;
	reg [31:0] write_data;
	reg [2:0] read_reg_1, read_reg_2, write_reg;
	reg signal_reg_write, clk;

	
	mips_registers reg_inst( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk);

	always
		begin 
			#2 clk = ~clk;
		end
		
	initial 
		begin 
			clk <= 'b1;
			read_reg_1 <= 3'b000; 
			read_reg_2 <= 3'b001; 
			
		#100
			signal_reg_write <= 'b1;
			write_reg <= 3'b000;
			write_data <= 32'b00000000000000000000000000001001; //9

		#100
			signal_reg_write <= 'b1;
			write_reg <= 3'b001;
			write_data <= 32'b00000000000000000000000000001101; //13
		
		#100 
			signal_reg_write <= 'b0;
			read_reg_1 <= 3'b000; 
			read_reg_2 <= 3'b001; 

			
		end
		
		initial begin
	$monitor("time = %2d\n read_reg_1 = %3b\n read_data_1 = %32b\n read_reg_2 = %3b\n read_data_2 = %32b\n write_reg = %3b\n write_data = %32b\n signal_reg_write = %1b\n\n",
				$time, read_reg_1, read_data_1, read_reg_2, read_data_2, write_reg, write_data, signal_reg_write);
		end
		
endmodule
	