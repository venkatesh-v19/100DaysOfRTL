`timescale 1ns / 1ps

module ringCounter(clk, rst, out);
	input clk, rst;
	output [3:0] out;
	reg [3:0] q;
	
	always@(posedge clk) begin
		if(rst) 
			q <= 4'b1000;
		else 
			q <= {q[0],q[3:1]};
	end

	assign out = q;

endmodule

