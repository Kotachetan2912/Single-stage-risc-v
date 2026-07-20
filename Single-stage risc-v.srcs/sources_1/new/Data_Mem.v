`timescale 1ns / 1ps

module Data_Mem(
    input [31:0] ALUResult,
    input [31:0] RD2,
    input clk,
    input MemWrite,
    output [31:0] ReadData
);
    // 64 memory locations, each 32 bits wide (Total: 256 Bytes)
    reg [31:0] mem[63:0]; 
    integer i;

    // Initialize the entire RAM to 0 at startup to kill 'X' states
    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            mem[i] = 32'b0;
        end
    end

    // Asynchronous Read: Restrict index to [7:2] (6 bits) for 64-word array
    assign ReadData = mem[ALUResult[7:2]];

    // Synchronous Write: Happens on the positive edge of the clock
    always @(posedge clk) begin
        if (MemWrite) begin
            mem[ALUResult[7:2]] <= RD2;
        end
    end
endmodule