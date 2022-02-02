module mux_8_1(R, S_0, S_1, S_2, I_0, I_1, I_2, I_3, I_4, I_5, I_6, I_7);

output R;
input S_0, S_1, S_2, I_0, I_1, I_2, I_3, I_4, I_5, I_6, I_7;

	wire mux4_0, mux4_1;
	
	mux_4_1 m0(mux4_0, S_0, S_1, I_0, I_1, I_2, I_3);
	mux_4_1 m1(mux4_1, S_0, S_1, I_4, I_5, I_6, I_7);

	mux_2_1 m2(R, S_2, mux4_0, mux4_1);

endmodule 