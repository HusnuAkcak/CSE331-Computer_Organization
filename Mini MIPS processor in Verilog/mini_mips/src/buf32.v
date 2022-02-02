module buf32(dest, source);
	
	input [31:0] source;
	output [31:0] dest;

	buf buf31(dest[31], source[31]);
	buf buf30(dest[30], source[30]);
	buf buf29(dest[29], source[29]);
	buf buf28(dest[28], source[28]);
	buf buf27(dest[27], source[27]);
	buf buf26(dest[26], source[26]);
	buf buf25(dest[25], source[25]);
	buf buf24(dest[24], source[24]);
	buf buf23(dest[23], source[23]);
	buf buf22(dest[22], source[22]);
	buf buf21(dest[21], source[21]);
	buf buf20(dest[20], source[20]);
	buf buf19(dest[19], source[19]);
	buf buf18(dest[18], source[18]);
	buf buf17(dest[17], source[17]);
	buf buf16(dest[16], source[16]);
	buf buf15(dest[15], source[15]);
	buf buf14(dest[14], source[14]);
	buf buf13(dest[13], source[13]);
	buf buf12(dest[12], source[12]);
	buf buf11(dest[11], source[11]);
	buf buf10(dest[10], source[10]);
	buf buf9 (dest[9 ], source[9 ]);
	buf buf8 (dest[8 ], source[8 ]);
	buf buf7 (dest[7 ], source[7 ]);
	buf buf6 (dest[6 ], source[6 ]);
	buf buf5 (dest[5 ], source[5 ]);
	buf buf4 (dest[4 ], source[4 ]);
	buf buf3 (dest[3 ], source[3 ]);
	buf buf2 (dest[2 ], source[2 ]);
	buf buf1 (dest[1 ], source[1 ]);
	buf buf0 (dest[0 ], source[0 ]);
	
	
endmodule 
