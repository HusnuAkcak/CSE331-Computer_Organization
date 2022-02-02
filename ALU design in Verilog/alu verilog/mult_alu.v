module mult_alu(multipliar_res, product_res, product, multipliar, multiplicant, alu_sign);

input [31:0] product, multipliar, multiplicant;
input alu_sign;
output [31:0] multipliar_res, product_res;


	wire [31:0] sum_pm, mux_res;
	wire C_O, transfer_bit, temp;
	
	full_adder_32 adder(sum_pm, C_O, product, multiplicant, 1'b0);
	
	mux_2_1 m31(mux_res[31], alu_sign, product[31], sum_pm[31]);
	mux_2_1 m30(mux_res[30], alu_sign, product[30], sum_pm[30]);
	mux_2_1 m29(mux_res[29], alu_sign, product[29], sum_pm[29]);
	mux_2_1 m28(mux_res[28], alu_sign, product[28], sum_pm[28]);
	mux_2_1 m27(mux_res[27], alu_sign, product[27], sum_pm[27]);
	mux_2_1 m26(mux_res[26], alu_sign, product[26], sum_pm[26]);
	mux_2_1 m25(mux_res[25], alu_sign, product[25], sum_pm[25]);
	mux_2_1 m24(mux_res[24], alu_sign, product[24], sum_pm[24]);
	mux_2_1 m23(mux_res[23], alu_sign, product[23], sum_pm[23]);
	mux_2_1 m22(mux_res[22], alu_sign, product[22], sum_pm[22]);
	mux_2_1 m21(mux_res[21], alu_sign, product[21], sum_pm[21]);
	mux_2_1 m20(mux_res[20], alu_sign, product[20], sum_pm[20]);
	mux_2_1 m19(mux_res[19], alu_sign, product[19], sum_pm[19]);
	mux_2_1 m18(mux_res[18], alu_sign, product[18], sum_pm[18]);
	mux_2_1 m17(mux_res[17], alu_sign, product[17], sum_pm[17]);
	mux_2_1 m16(mux_res[16], alu_sign, product[16], sum_pm[16]);
	mux_2_1 m15(mux_res[15], alu_sign, product[15], sum_pm[15]);
	mux_2_1 m14(mux_res[14], alu_sign, product[14], sum_pm[14]);
	mux_2_1 m13(mux_res[13], alu_sign, product[13], sum_pm[13]);
	mux_2_1 m12(mux_res[12], alu_sign, product[12], sum_pm[12]);
	mux_2_1 m11(mux_res[11], alu_sign, product[11], sum_pm[11]);
	mux_2_1 m10(mux_res[10], alu_sign, product[10], sum_pm[10]);
	mux_2_1 m9 (mux_res[9],  alu_sign, product[9] , sum_pm[9] );
	mux_2_1 m8 (mux_res[8],  alu_sign, product[8] , sum_pm[8] );
	mux_2_1 m7 (mux_res[7],  alu_sign, product[7] , sum_pm[7] );
	mux_2_1 m6 (mux_res[6],  alu_sign, product[6] , sum_pm[6] );
	mux_2_1 m5 (mux_res[5],  alu_sign, product[5] , sum_pm[5] );
	mux_2_1 m4 (mux_res[4],  alu_sign, product[4] , sum_pm[4] );
	mux_2_1 m3 (mux_res[3],  alu_sign, product[3] , sum_pm[3] );
	mux_2_1 m2 (mux_res[2],  alu_sign, product[2] , sum_pm[2] );
	mux_2_1 m1 (mux_res[1],  alu_sign, product[1] , sum_pm[1] );
	mux_2_1 m0 (mux_res[0],  alu_sign, product[0] , sum_pm[0] );

	shift_right s0(product_res, transfer_bit, mux_res, 1'b0);
	shift_right s1(multipliar_res, temp, multipliar, transfer_bit);
	
endmodule
