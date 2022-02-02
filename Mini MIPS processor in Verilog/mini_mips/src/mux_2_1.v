module mux_2_1(R, S, I_0, I_1);
	output  R;
	input S, I_0, I_1;


	wire s_not, and_0, and_1;
	
	not not0(s_not, S);
	
	and and0(and_0, s_not, I_0);
	and and1(and_1, S, I_1);
	
	or or0(R, and_0, and_1);

endmodule 