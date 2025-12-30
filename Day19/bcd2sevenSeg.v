`timescale 1ns / 1ps
/*
	=> Segment order: a b c d e f g
	=> Display type: Common Cathode (Active HIGH)
	=> bcd - Binary Coded Decimal
	=> ssd - Seven Segment Display
*/
module bcd2sevenSeg(bcd,ssd);

	input [3:0] bcd;
	output reg[6:0] ssd;
	
	always@(*)begin
		case(bcd) 
		4'd0: ssd = 7'b1111110;
         4'd1: ssd = 7'b0110000;
         4'd2: ssd = 7'b1101101;
         4'd3: ssd = 7'b1111001;
         4'd4: ssd = 7'b0110011;
         4'd5: ssd = 7'b1011011;
         4'd6: ssd = 7'b1011111;
         4'd7: ssd = 7'b1110000;
         4'd8: ssd = 7'b1111111;
         4'd9: ssd = 7'b1111011;
         default: ssd = 7'b0000000;
		endcase
	end
endmodule



