////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 20:06:26
// Design Name: 
// Module Name: MAIN_Decoder
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

module MainDecoder(
    input [6:0] op,
    output reg RegWrite,
    output reg MemWrite,
    output reg Branch,
    output reg ResultSrc,
    output reg PCSrc,
    output reg ALUSrc,
    output reg [1:0] ALUop,
    output reg [1:0] ImmSrc,
    output reg jump // ADDED JUMP
);
    always @(*) begin
        // Default initialization
        RegWrite = 0;
        MemWrite = 0;
        Branch = 0;
        ALUSrc = 0;
        ALUop = 2'b00;
        ImmSrc = 2'b00;
        ResultSrc = 0;
        jump = 0; // DEFAULT JUMP

        case(op)
            7'b0000011: begin // Load Word Instruction
                RegWrite = 1;
                ALUSrc = 1;
                ResultSrc = 1;
            end
            7'b0100011: begin // Store Word Instruction
                MemWrite = 1;
                ALUSrc = 1;
                ImmSrc = 2'b01;
            end
            7'b1100011: begin // Branch Instruction
                Branch = 1;
                ALUop = 2'b01;
                ImmSrc = 2'b10;
            end
            7'b0010011: begin // I-type Instruction
                RegWrite = 1;
                ALUSrc = 1;
                ALUop = 2'b10;
            end
            7'b0110011: begin // R-type Instruction (You were missing this!)
                RegWrite = 1;
                ALUop = 2'b10;
                ALUSrc = 1'b0; 
            end
            7'b1101111: begin // JAL (Jump)
                jump = 1;
                RegWrite = 1;
            end
        endcase
    end
endmodule