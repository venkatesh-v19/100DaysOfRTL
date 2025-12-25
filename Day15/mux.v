`timescale 1ns / 1ps
module mux #(parameter M = 3, N = 2**M)(
    input [M-1:0] sel,
    input [N-1:0] d,
    output y
);
    assign y = d[sel];
endmodule