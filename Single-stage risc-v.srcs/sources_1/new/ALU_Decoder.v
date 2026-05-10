
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 19:43:05
// Design Name: 
// Module Name: ALU_Decoder
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
module ALUDecoder(
    input [6:0] op,
    input [2:0] funct3,
    input funct7,
    input [1:0] ALUop,
    output reg [2:0] ALUControl
);
    always @(*) begin
        if (ALUop == 2'b00) begin
            ALUControl <= 3'b000; // ADD
        end else if (ALUop == 2'b01) begin
            ALUControl <= 3'b001; // SUB
        end else if (ALUop == 2'b10) begin
            case({funct7, funct3, op})
                10'b0000000_000: ALUControl <= 3'b000;
                10'b0100000_000: ALUControl <= 3'b001;
                10'b0000000_111: ALUControl <= 3'b010;
                10'b0000000_110: ALUControl <= 3'b011;
                default: ALUControl <= 3'bxxx;
            endcase
        end
    end
endmodule