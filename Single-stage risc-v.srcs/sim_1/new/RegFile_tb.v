`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2026 16:13:34
// Design Name: 
// Module Name: RegFile_tb
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


module RegFile_tb;
reg WE3;
reg clk;
reg [4:0] A1;
reg [4:0] A2;
reg [4:0] A3;
reg [31:0] WD3;
wire [31:0] RD1;
wire [31:0] RD2;

Register_File uut (.WE3(WE3), .clk(clk), .A1(A1), .A2(A2), .A3(A3), .WD3(WD3), .RD1(RD1), .RD2(RD2));

initial begin
clk = 0; WE3 = 0; A1 = 0; A2 = 0; A3 = 0; WD3 = 0;
#10;
$finish();
end

always #1 clk<=~clk;
always #1 WE3<=~WE3;
always #2 A1<=~A1;
always #2 A2<=~A2;
always #3 A3<=~A3;
always #3 WD3<=~WD3;


endmodule