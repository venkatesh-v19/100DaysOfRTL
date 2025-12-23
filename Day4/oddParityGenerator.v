`timescale 1ns / 1ps

module oddParityGenerator(in, x);
	input [2:0] in;
	output x;
	xor(x,in[2], in[1], in[0]);

endmodule
