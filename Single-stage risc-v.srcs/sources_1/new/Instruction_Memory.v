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
    input [31:0] pc_out, 
    output reg [31:0] instr
);
    reg [31:0] mem[63:0];
    integer i;

    initial begin
        // 1. Initialize all memory to NOP (addi x0, x0, 0)
        for (i = 0; i < 64; i = i + 1) begin
            mem[i] = 32'h00000000; 
        end

        // 2. Load your specific RISC-V program
        mem[0] = 32'h00A00093; // addi x1, x0, 10
        mem[1] = 32'h01400113; // addi x2, x0, 20
        mem[2] = 32'h01E00193; // addi x3, x0, 30
        mem[3] = 32'h00208233; // add x4, x1, x2
        mem[4] = 32'h401102B3; // sub x5, x2, x1
        mem[5] = 32'h00000013; // and x6, x1, x2
        mem[6] = 32'h0020E3B3; // or x7, x1, x2
        mem[7] = 32'h0020A433; // slt x8, x1, x2
        mem[8] = 32'h00402023; // sw x4, 0(x0)
        mem[9] = 32'h00002483; // lw x9, 0(x0)
        mem[10] = 32'h00B50633;
        mem[11] = 32'h406281B3;
        
    end

    always @(*) begin
        // The PC increments by 4, but our memory array is indexed by 1. 
        // Shifting right by 2 (pc_out[31:2]) converts byte-address to word-address.
        instr = mem[pc_out[31:2]]; 
    end
endmodule
 