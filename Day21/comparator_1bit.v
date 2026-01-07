//4:1 MUX
module mux4as1(in,sel,out);
	input [3:0] in;
	input [1:0] sel;
	output out;
	
	assign out = in[sel];
endmodule

//1-Bit Comparator
module comparator_1bit(a,b,gt,lt,eq);
	input a,b;
	output gt,lt,eq;
	
	mux4as1 m1(.in({1'b0,1'b1,1'b0,1'b0}),.sel({b,a}),.out(lt));
	mux4as1 m2(.in({1'b1,1'b0,1'b0,1'b1}),.sel({b,a}),.out(eq));
	mux4as1 m3(.in({1'b0,1'b0,1'b1,1'b0}),.sel({b,a}),.out(gt));
	
endmodule

