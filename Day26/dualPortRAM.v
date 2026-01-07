`timescale 1ns / 1ps

module dualPortRAM(clk,rst,wr_en,rd_en,din,wr_add,rd_add,dout);
	//Input Ports
	input clk,rst;
	input wr_en, rd_en;
	input [5:0] wr_add,rd_add;
	input [7:0] din;
	//Output Ports
	output reg [7:0] dout;
	//RAM memory
	reg [7:0] ram [63:0];
	//Integer (for RAM RESET purpose)
	integer i;
	
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			//RAM RESET
			for(i=0;i<64;i=i+1)begin
				ram[i] <= 8'd0;
			end
			//Output RESET
			dout <=8'd0;
		end
		else begin
			//To maintain Read-Write equal priority,
			//both conditions are written under IF conditions
			if(wr_en)begin
				ram[wr_add] <= din;
			end
			if(rd_en)begin
				dout <= ram[rd_add];
			end
		end
	end
endmodule


