`timescale 1ns / 1ps

module tb_Top;

//Inputs
reg CLK;
reg signed [15 : 0] x;
//Outputs
wire signed [32 : 0] y;
// Clock generation 
initial CLK <= 0;
always #50 CLK <= ~CLK;
//Instantiate DUT
top DUT ( .CLK(CLK), .x(x), .y(y) );
    wire signed [15:0] reg_16_Out = DUT.reg_16_Out;
    wire signed [31:0] reg_32_Out = DUT.reg_32_Out;


initial
begin
        x <= 16'b0000000010000101;
    @(posedge CLK);
        x <= 16'b0000011111010100;
    @(posedge CLK);
        x <= 16'b0000000010111101;
    @(posedge CLK);
        x <= 16'b0000001010110101;
    @(posedge CLK);
        x <= 16'b0000001001111111;
    @(posedge CLK);
        x <= 16'b1111110001010000;
    @(posedge CLK);
        x <= 16'b1111100101001000;
    @(posedge CLK);
        x <= 16'b0000000111011101;
    @(posedge CLK);
        x <= 16'b1111110101110000;
    @(posedge CLK);
        x <= 16'b0000001001100001;
end
endmodule

