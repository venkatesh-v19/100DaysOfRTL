`timescale 1ns / 1ps

module bidShift_reg(clk,rst,dir,d,q);
	input clk,rst,dir;
	input d;
	output[3:0] q;
	reg[3:0] mem;
	
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			mem <= 4'b0000;
		end
		else begin
			if(dir) begin
				mem <= {d,mem[3:1]};
			end
			else begin
				mem <= {mem[2:0],d};
			end
		end
	end
	assign q = mem;
endmodule
