`timescale 1ns / 1ps
//T Flipflop
module tff(clk,rst,out);
	input clk,rst;
	output reg out;
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			out <= 1'b1;
		end
		else begin
			out <= ~out;
		end
	end
endmodule
//4-bit Asynchronous Down Counter
module downCounter(rst,clk,q);
	input rst,clk;
	output [3:0]q;
	tff tf1(.clk(clk),.rst(rst),.out(q[0]));
	tff tf2(.clk(q[0]),.rst(rst),.out(q[1]));
	tff tf3(.clk(q[1]),.rst(rst),.out(q[2]));
	tff tf4(.clk(q[2]),.rst(rst),.out(q[3]));
endmodule


