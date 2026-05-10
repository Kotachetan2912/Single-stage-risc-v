`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2026 16:46:44
// Design Name: 
// Module Name: MUX_ALUSrc_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module MUX_ALUSrc_tb;

reg RD2, ImmExt, ALUSrc;
wire SrcB;

MUX_ALUSrc dut(RD2, ImmExt, ALUSrc, SrcB);

initial begin 
RD2<=1'b0;
ImmExt<=1'b0;
ALUSrc<=1'b0;

#10 $finish();
end
initial begin
    ALUSrc = 0; RD2 = 32'hAAAA; ImmExt = 32'h5555;
    #10; 
    ALUSrc = 1; 
    #10; 
    ImmExt = 32'h1234;
    #10;
    ALUSrc = 0;
    #10;
end
endmodule