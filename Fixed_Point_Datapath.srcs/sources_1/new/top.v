`timescale 1ns / 1ps

module top
(   input CLK,
    input wire signed [15 : 0] x,
    output signed [32 : 0] y
);
    localparam x_WI = 8;
    localparam x_WF = 8;
    localparam d_x_squared_WI = 16;
    localparam d_x_squared_WF = 16;
    
    wire signed [31:0] mult_Out;
    wire signed [15:0] reg_16_Out;
    wire signed [31:0] reg_32_Out;
    
    
    mult_Fixed # ( .WI1(x_WI), .WF1(x_WF), .WI2(x_WI), .WF2(x_WF) )
                myMultiplier ( .RESET(0), .in1(x), .in2(x), .out(mult_Out) );
    
    register # ( .WL_reg(16) )
            reg_16_bit ( .CLK(CLK), .D(x), .Q(reg_16_Out) );
    
    register # ( .WL_reg(32) )
            reg_32_bit ( .CLK(CLK), .D(mult_Out), .Q(reg_32_Out) );
    
    add_Fixed # ( .WI1(d_x_squared_WI), .WF1(d_x_squared_WF), .WI2(x_WI), .WF2(x_WF) )
                myAdder ( .RESET(0), .in1(reg_32_Out), .in2(reg_16_Out), .out(y) );
    
endmodule
