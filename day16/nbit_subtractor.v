`timescale 1ns / 1ps

module nbit_subtractor(a,b,diff,borrow);
	parameter N = 8;
	input [N-1:0] a,b;
	output [N-1:0] diff;
	output borrow;
	
	wire [N-1:0] borrow_chain;
	
	full_subtractor uut(.a(a[0]),.b(b[0]),.bin(1'b0),.diff(diff[0]),.borrow(borrow_chain[0]));
	
	genvar i;
	generate
	for(i=1;i<N;i=i+1) begin : LOOP
		full_subtractor uut1(.a(a[i]),.b(b[i]),.bin(borrow_chain[i-1]),.diff(diff[i]),.borrow(borrow_chain[i]));
	end
	endgenerate
	assign borrow = borrow_chain[N-1];

endmodule

module full_subtractor(a,b,bin,diff,borrow);
	input a,b;
	input bin;
	output diff, borrow;
	
	assign diff = a ^ b ^ bin;
	assign borrow = (~a & b)|(b & bin)|(~a & bin);
endmodule
