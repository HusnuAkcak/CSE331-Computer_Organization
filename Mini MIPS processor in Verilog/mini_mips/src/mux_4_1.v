module mux_4_1(R, S_0, S_1, I_0, I_1, I_2, I_3);

output R;
input S_0, S_1, I_0, I_1, I_2, I_3;

	wire mux_0, mux_1;
	
	mux_2_1 m0(mux_0, S_1, I_0, I_2);
	mux_2_1 m1(mux_1, S_1, I_1, I_3);

	mux_2_1 m2(R, S_0, mux_0, mux_1);

endmodule 