`timescale 1ns / 1ps

module shift_operations(in, opcode, out);
  input  [6:0] in;
  input  [2:0] opcode;
  output reg [6:0] out;

  always @(*) begin
    case (opcode)
      3'b000 : out = in << 1;              // Logical left shift
      3'b001 : out = {in[6], in[6:1]};     // Arithmetic right shift
      3'b010 : out = in >> 1;              // Logical right shift
      3'b011 : out = {in[5:0], in[6]};     // Left rotate
      3'b100 : out = {in[0], in[6:1]};     // Right rotate
      default : out = 7'd0;
    endcase
  end
endmodule


