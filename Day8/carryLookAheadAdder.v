`timescale 1ns / 1ps

module carryLookAheadAdder(A,B,S,Cin,Cout);
	input [3:0] A,B;
	input Cin;
	output [3:0] S;
	output Cout;
	
	wire [3:0] P,G;
	wire [2:0] C;

	assign P = A ^ B;
	assign G = A & B;
	
	assign C[0] = G[0] | (Cin & P[0]);
	assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
	assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) 
	| (P[2] & P[1] & P[0] & Cin);
	assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) 
	| (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
	
	assign S[0] = P[0] ^ Cin;
	assign S[1] = P[1] ^ C[0];
	assign S[2] = P[2] ^ C[1];
	assign S[3] = P[3] ^ C[2];
	
endmodule
