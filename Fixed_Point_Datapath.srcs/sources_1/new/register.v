`timescale 1ns / 1ps

module register # (parameter WL_reg = 16)
(
    input CLK,
    input [WL_reg - 1 : 0] D,
    output reg [WL_reg - 1 : 0] Q
);
always @(posedge CLK)
    Q = D;
endmodule
