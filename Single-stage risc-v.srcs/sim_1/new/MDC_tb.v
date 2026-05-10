`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 20:13:21
// Design Name: 
// Module Name: MDC_tb
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

module MDC_tb;

reg [6:0] op;
wire RegWrite;
wire MemWrite;
wire Branch;
wire ALUSrc;
wire [1:0] ALUop;
wire [1:0] ImmSrc;

MainDecoder uut (op, RegWrite, MemWrite, Branch, ALUSrc, ALUop, ImmSrc);

initial begin
$dumpfile("dump.vcd");
$dumpvars(0);

op<=1'b0;
#10 $finish();
end

always #2 op<=~op;
endmodule