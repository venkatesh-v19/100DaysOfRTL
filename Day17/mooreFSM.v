`timescale 1ns / 1ps

module mooreFSM(clk,rst,in,out);

	input clk,rst;
	input in;
	output out;
	
	parameter IDLE = 3'b000,
	s1 = 3'b001,
	s10 = 3'b010,
	s101 = 3'b011,
	s1010 = 3'b100;
	
	reg [2:0] state, nxt_state;
	
	//SEQUENTIAL LOGIC - FOR DETERMINING THE STATE
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			state <= IDLE;
		end
		else begin
			state <= nxt_state;
		end
	end
	
	//COMBINATIONAL LOGIC - FOR NEXT STATE 
	always@(*) begin
		case(state)
			IDLE : nxt_state = in ? s1 : IDLE;
			s1 : nxt_state = in ? s1 : s10;
			s10 : nxt_state = in ? s101 : IDLE;
			s101 : nxt_state = in ? s1 : s1010;
			s1010 : nxt_state = in ? s101 : IDLE;
			default : nxt_state = IDLE;
		endcase
	end
	
	//COMBINATIONAL LOGIC - FOR THE OUTPUT
	assign out = (state == s1010);

endmodule
