module mips_data_memory_tb();

	wire [31:0] read_data;
	reg [31:0] write_data, address;
	reg mem_write, mem_read, clk;
	
	mips_data_memory inst(read_data, address, write_data, mem_write, mem_read, clk);
	

	always 
	begin 
		#50 clk <= ~clk;
	end
	
	initial
	begin

		clk <= 'b0;
		mem_read <= 'b1; 
		mem_write <= 'b0;
		address <= 32'b00000000000000000000000000000001; 
			
	#100
		mem_write <= 'b1;
		mem_read <= 'b0;
		address <= 32'b00000000000000000000000000000001; 
		write_data <= 32'b00000000000000000000000000001111; 
		
	#100
		mem_read <= 'b1; 
		mem_write <= 'b0;
		address <= 32'b00000000000000000000000000000001;
	end 
	
	initial begin 
		$monitor("time = %2d\t clk= %1b\t mem_read= %1b\t mem_write= %1b\t read_data= %32b\t write_data= %32b\t address= %32b\n",
				$time, clk, mem_read, mem_write, read_data, write_data, address);
	end 

endmodule 
