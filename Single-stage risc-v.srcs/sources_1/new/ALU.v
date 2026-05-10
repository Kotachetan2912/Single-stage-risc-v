`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 12:07:09
// Design Name: 
// Module Name: ALU
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

module ALU(
    input  [31:0] RD1,
    input  [31:0] RD2,
    input  [2:0]  ALUControl,
    output reg zero,
    output reg [31:0] ALUResult
);

    always @(*) begin
        case(ALUControl)
            3'b000: ALUResult = RD1 + RD2; 
            3'b001: ALUResult = RD1 - RD2;
            3'b010: ALUResult = RD1 & RD2; 
            3'b011: ALUResult = RD1 | RD2; 
            3'b101: ALUResult = (RD1 < RD2) ? 32'd1 : 32'd0; 
            
            default: ALUResult = 32'b0;
         endcase 
         
        if (ALUResult == 32'd0) begin
             zero = 1'b1;
         end else begin
             zero = 1'b0;
         end
    end

endmodule