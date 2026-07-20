`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 20:13:21
// Design Name: 
// Module Name: MDC_tb
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
`timescale 1ns / 1ps

module MDC_tb;

    // 1. Inputs to the Decoder
    reg [6:0] op;
    
    // 2. Mock Input from the ALU (Needed to calculate PCSrc)
    reg zero; 

    // 3. Outputs from the Decoder
    wire RegWrite;
    wire MemWrite;
    wire Branch;
    wire ResultSrc;
    wire ALUSrc;
    wire [1:0] ALUop;
    wire [1:0] ImmSrc;
    wire jump;

    // 4. The signal you want to see!
    wire PCSrc; 

    // Instantiate using Named Port Mapping (Fixes the port mismatch)
    MainDecoder uut (
        .op(op), 
        .RegWrite(RegWrite), 
        .MemWrite(MemWrite), 
        .Branch(Branch), 
        .ResultSrc(ResultSrc), 
        .ALUSrc(ALUSrc), 
        .ALUop(ALUop), 
        .ImmSrc(ImmSrc),
        .jump(jump),
        .zero(zero)
    );

    // Calculate PCSrc just like your Datapath does
    assign PCSrc = (Branch & zero);

    // Test Sequence
    initial begin
        $dumpfile("mdc_waves.vcd");
        $dumpvars(0, MDC_tb);

        // Test 1: R-Type (add) -> PCSrc should be 0
        op = 7'b0110011; 
        zero = 0; 
        #10;

        // Test 2: Branch (beq) where inputs are NOT equal (Zero = 0)
        // PCSrc should be 0 because we don't take the branch
        op = 7'b1100011; 
        zero = 0; 
        #10;

        // Test 3: Branch (beq) where inputs ARE equal (Zero = 1)
        // PCSrc should jump to 1!
        op = 7'b1100011; 
        zero = 1; 
        #10;

        // Test 4: Jump (jal)
        // PCSrc should be 1 regardless of the Zero flag!
        op = 7'b1101111; 
        zero = 0; 
        #10;

        $finish();
    end

endmodule