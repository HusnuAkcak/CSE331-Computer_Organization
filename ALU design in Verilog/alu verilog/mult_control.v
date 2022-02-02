module mult_control( count, lm, lp, sm, clk, start, done);

input clk, start, done;
output count, lm, lp, sm;


	reg [2:0] state, next_state;
	wire n0_out, n1_out, n2_out;
			
	initial
	begin 
		state = 3'b000;
	end 
	
	wire not0_out, not1_out, not2_out;
	wire and0_out, and1_out;
	not not0(not0_out, state[0]);
	not not1(not1_out, state[1]);
	not not2(not2_out, state[2]);
	and and0(and0_out, start, not0_out, not1_out, not2_out);
	and and1(and1_out, not0_out, state[1], not2_out);
	
	wire and2_out, and3_out, and4_out;
	and and2(and2_out, state[0], not1_out, not2_out);
	and and3(and3_out, not0_out, state[1], not2_out);
	and and4(and4_out, state[0], state[1], not2_out, done);
	
	wire or0_out, or1_out, and5_out;
	or or0(or0_out, and0_out, and1_out);
	or or1(or1_out, and2_out, and3_out, and4_out);
	and and5(and5_out, not2_out, state[1], state[0], done);

	
	and and6(count, not2_out, state[1], state[0]);
	
	or or2(lm, and3_out, and2_out);
	or or3(lp, 1'b0, and3_out);
	or or4(sm, 1'b0, and2_out);
	
	
	
	always@(posedge clk)	begin 
		state[0] <= or0_out;
		state[1] <= or1_out;
		state[2] <= and5_out;
			
	end


endmodule 