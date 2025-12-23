`timescale 1ns / 1ps

module clkDivider(clk, rst, divby2, divby4, divby8, divby16);
	
	input clk, rst;
	output divby2, divby4, divby8, divby16;
	reg [3:0] count;
	
	always@(posedge clk) begin
		if(rst)
			count <= 4'b0000;
		else begin
			count <= count + 1'b1;
		end
	end
	
	assign divby2 = count[0];
	assign divby4 = count[1];
	assign divby8 = count[2];
	assign divby16 = count[3];

endmodule
