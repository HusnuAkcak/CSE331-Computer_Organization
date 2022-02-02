module mips_data_memory(read_data, address, write_data, mem_write, mem_read, clk);

	output reg [31:0] read_data;
	input [31:0] write_data, address;
	input mem_write, mem_read, clk;
	
	reg [31:0] data [255:0];
	
	initial 
	begin 
		$readmemb("data.txt", data);
	end 
	
	always@(*)
	begin 
		if(mem_read)
		begin 
			read_data <= data[address];
		end 
	end 
	
	always @(posedge clk) 
	begin
		if(mem_write)
		begin 
			data[address] = write_data;
			$writememb("data.txt", data);
		end 	
	end

	
endmodule
