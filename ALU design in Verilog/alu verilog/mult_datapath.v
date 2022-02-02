module mult_datapath(product_res, multipliar_res, stop, 
multiplicant, multipliar, multipliar_sign, product_sign, start_mult_sign, clock_sign, count_sign);

output [31:0] product_res, multipliar_res;
output stop;
input [31:0] multiplicant, multipliar;
input multipliar_sign, product_sign, start_mult_sign, clock_sign, count_sign;

	wire [31:0] mux_res;
	reg [31:0] reg_zero, reg_product, reg_multipliar, final_count, counter;

	
	initial
	begin 
		counter 			 <= 32'b00000000000000000000000000000000;
		final_count 	 <= 32'b00000000000000000000000000011111;
		reg_product     <= 32'b00000000000000000000000000000000;
		reg_multipliar  <= 32'b00000000000000000000000000000000;
		reg_zero 	    <= 32'b00000000000000000000000000000000;
	end 
	
	
	mult_alu alu_inst(multipliar_res, product_res, reg_product, multipliar, multiplicant, multipliar[0]);
	
	mux32_2_1 m0(mux_res, start_mult_sign, multipliar_res, multipliar);
	
	wire [31:0] add0_out, slt0_out;
	wire C_O;
	full_adder_32 add0(add0_out, C_O, counter, reg_zero, 1'b1); // counter = counter + 1, will be set in always block
	slt_32 slt0(slt0_out, counter, final_count);	// if (counter < final_count) then { slt0_out[0] = 1 }
	mux_2_1 mux0(stop, slt0_out[0], 1'b1, 1'b0); // if (slt0_out[0] == 1) then { stop = 0 } else { stop = 1 }
	
	wire [31:0] m1_out;
	mux32_2_1 m1(m1_out, count_sign, counter, add0_out); // counter will be changed when count_sign 
	always@(posedge clock_sign)	
	begin 
		counter <= m1_out;
	end
	
	
	wire [31:0] m2_out;
	mux32_2_1 m2(m2_out, multipliar_sign, reg_multipliar, mux_res); // reg_multipliar will be changed when multipliar_sign arrived
	always@(posedge clock_sign)	
	begin 
		reg_multipliar <= m2_out;
	end
	
	
	wire [31:0] m3_out;
	mux32_2_1 m3(m3_out, product_sign, reg_product, product_res); // will be changed when product_sign arrived
	always@(posedge clock_sign)	
	begin 
		reg_product <= m3_out;
	end
	
endmodule 
