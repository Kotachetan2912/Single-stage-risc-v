//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 20:01:57
// Design Name: 
// Module Name: ALDC_tb
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

module ALDC_tb;

    reg [6:0] op;
    reg [2:0] funct3;
    reg funct7;
    reg [1:0] ALUop;
    wire [2:0] ALU_Control;

    ALUDecoder uut (
        .op(op),
        .funct3(funct3),
        .funct7(funct7),
        .ALUop(ALUop),
        .ALU_Control(ALU_Control)
    );

    
    initial begin
        // Initialize inputs
        op = 7'b0000000;
        funct3 = 3'b000;
        funct7 = 1'b0;
        ALUop = 2'b00;

       
        #10;
        ALUop = 2'b00; // Test ADD
        #10;
        ALUop = 2'b01; // Test SUB
        #10;
        ALUop = 2'b10; // Test R-type instructions

        op = 7'b0000000;
        funct3 = 3'b000;
        funct7 = 1'b0;
        #10;
 
        op = 7'b0100000;
        funct3 = 3'b000;
        funct7 = 1'b0;
        #10;
        
        
        op = 7'b0000000;
        funct3 = 3'b111;
        funct7 = 1'b0;
        #10;
        op = 7'b0000000;
        funct3 = 3'b110;
        funct7 = 1'b0;
        #10;
        op = 7'b1111111;
        funct3 = 3'b111;
        funct7 = 1'b1;
        #10;
        
        $finish;
    end
endmodule