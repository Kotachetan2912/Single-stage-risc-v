`timescale 1ns / 1ps
module ALUControl(
    input [6:0] op,
    input [2:0] funct3,
    input [6:0] funct7,
    input zero,
    output wire PCSrc,
    output wire jump,
    output wire ALUSrc,
    output wire RegWrite,
    output wire ResultSrc,
    output wire MemWrite,
    output wire branch,
    output wire [1:0] ImmSrc,
    output wire [2:0] ALU_Control
);
    wire [1:0] ALUop;
    
    // FIXED: Used named mapping to perfectly route all 9 signals
    MainDecoder md (
        .op(op), 
        .RegWrite(RegWrite), 
        .MemWrite(MemWrite), 
        .Branch(branch), 
        .ResultSrc(ResultSrc), 
        .ALUSrc(ALUSrc), 
        .ALUop(ALUop), 
        .ImmSrc(ImmSrc),
        .jump(jump) // CONNECTED JUMP
    );
    
    // FIXED: Passed the whole funct7, since your ALUDecoder takes a 7-bit input
    ALUDecoder ad(op, funct3, funct7, ALUop, ALU_Control);
    
    assign PCSrc = (branch & zero);
endmodule