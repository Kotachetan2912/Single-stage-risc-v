`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 20:50:06
// Design Name: 
// Module Name: InstrMem_tb
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


module InstrMem_tb;
    reg [31:0] A;
    wire [31:0] RD;
    Instruction_Memory dut (
        .A(A),
        .RD(RD)
    );

    initial begin
        A = 32'h00000000;
        #10;
        A = 32'h00000004;
        #10; 
        A = 32'h00000008;
        #10; 
        A = 32'h0000000C;
        #10; 
        $finish;
    end

endmodule