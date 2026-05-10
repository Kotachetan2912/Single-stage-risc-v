`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 16:19:56
// Design Name: 
// Module Name: Data_Mem
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


module Data_Mem(
input [31:0]ALUResult,
input [31:0]RD2,
input clk,
input MemWrite,
output [31:0]ReadData
    );
    reg [31:0] mem[63:0]; 
    assign ReadData = mem[ALUResult[31:2]];
    always @(posedge clk) begin
    if(MemWrite)
    mem[ALUResult[31:2]] <= RD2;
    end
endmodule
