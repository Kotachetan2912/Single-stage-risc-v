`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 20:29:33
// Design Name: 
// Module Name: Instruction_Memory
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



module Instruction_Memory(
input [31:0]A, 
output reg [31:0]RD 
    );
 
    reg [31:0] mem[63:0];

    initial begin
        mem[0] = 32'h00500064; 
        mem[1] = 32'h00A00112; 
        mem[2] = 32'h002081B3;  
        mem[3] = 32'h00A00063;  
    end

    
    always @(*) begin
        RD = mem[A[31:2]]; 
    end
endmodule

 