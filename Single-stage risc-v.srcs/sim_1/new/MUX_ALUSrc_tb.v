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
    reg [31:0] RD2;
    reg [31:0] ImmExt;
    reg ALUSrc;
    wire [31:0] SrcB;

    MUX_ALUSrc dut(
        .RD2(RD2), 
        .ImmExt(ImmExt), 
        .ALUSrc(ALUSrc), 
        .SrcB(SrcB)
    );

    initial begin
        ALUSrc = 0; RD2 = 32'hAAAA_BBBB; ImmExt = 32'h5555_1111;
        #10; 
        ALUSrc = 1; 
        #10; 
        ImmExt = 32'h1234_5678;
        #10;
        ALUSrc = 0;
        #10;
        ALUSrc = 0;
        #50;
        $finish(); // Only call $finish ONCE at the end!
    end
endmodule