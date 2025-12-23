`timescale 1ns / 1ps

module inputMajorityChecker(in,out);

	input [4:0] in;
	output out;
	wire [2:0] sum;
	
	assign sum = in[0] + in[1] + in[2] + in[3] + in[4];
	
	assign out = (sum >=3);
	
endmodule
