`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2026 17:20:05
// Design Name: 
// Module Name: Extend_tb
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

module Extend_tb;

    reg [31:7] instr; 
    reg [1:0] ImmSrc;
    wire [31:0] ImmExt;

    Extend dut (
        .instr(instr),
        .ImmSrc(ImmSrc),
        .ImmExt(ImmExt)
    );

    initial begin
        instr = 25'b0;
        ImmSrc = 2'b00;
        #10 instr= 25'b1000000000000000000000000; ImmSrc = 2'b00; 
        #10 instr = 25'b0000000000000000000000000; ImmSrc = 2'b00; 
        #10 instr = 25'b1000000000000000000000000; ImmSrc = 2'b01;
        #10 instr = 25'b0000000000000000000000000; ImmSrc = 2'b01;
        #10 instr = 25'b1000000000000000000000000; ImmSrc = 2'b10;
        #10 instr = 25'b0000000000000000000000000; ImmSrc = 2'b10;
        #10 instr = 25'b1000000000000000000000000; ImmSrc = 2'b11;
        #10 instr = 25'b0000000000000000000000000; ImmSrc = 2'b11;
        #10 $finish();
    end
endmodule
