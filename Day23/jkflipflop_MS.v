`timescale 1ns / 1ps

// Basic JK Flip-Flop
module jkflipflop(j, k, rst, clk, q, qb);
    input j, k, clk, rst;
    output reg q;
    output qb;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else begin
            case ({j, k})
                2'b00: q <= q;     // No change
                2'b01: q <= 1'b0;  // Reset
                2'b10: q <= 1'b1;  // Set
                2'b11: q <= ~q;    // Toggle
                default: q <= q;
            endcase
        end
    end
    assign qb = ~q;
endmodule

// Master–Slave JK Flip-Flop
module jkflipflop_MS(j, k, rst, clk, q, qb);
    input j, k, clk, rst;
    output reg q;
    output qb;

    wire qm, qmb;

    // Master JK (positive edge)
    jkflipflop master (
        .j(j),
        .k(k),
        .rst(rst),
        .clk(clk),
        .q(qm),
        .qb(qmb)
    );

    // Slave JK (negative edge)
    jkflipflop slave (
        .j(qm),
        .k(qmb),
        .rst(rst),
        .clk(~clk),
        .q(q),
        .qb(qb)
    );
endmodule
