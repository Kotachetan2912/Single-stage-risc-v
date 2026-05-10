`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 20:58:00
// Design Name: 
// Module Name: Program_Counter
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

module Program_counter(
input clk, reset, 
input [31:0] pc_in,
input start_add, // Input Port
output reg [31:0] pc_out // Output Port
    );

    always@(posedge clk)
    if (reset)
        pc_out<=start_add; // In initial Stage, output of PC will be the initial address i,e, 1000
    else
        pc_out<=pc_in;  // In the next cycle, output will be incremented to four of previous stage. Example: 1000 + 4= 1004, in next cycle it is 1008
endmodule