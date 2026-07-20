module ALUDecoder(
    input [6:0] op,
    input [2:0] funct3,
    input [6:0] funct7, // MUST be 7 bits to match your Datapath
    input [1:0] ALUop,
    output reg [2:0] ALU_Control
);
    // In RISC-V, I-Type and R-Type share ALUop = 10.
    // We only trigger subtraction if it is an R-Type AND funct7[5] is 1.
    wire R_type_sub = (op[5] & funct7[5]); 

    always @(*) begin
        if (ALUop == 2'b00) begin
            ALU_Control = 3'b000;      // ADD (for Loads, Stores, and Addi)
        end else if (ALUop == 2'b01) begin
            ALU_Control = 3'b001;      // SUB (for Branches)
        end else if (ALUop == 2'b10) begin
            case(funct3)
                3'b000: ALU_Control = R_type_sub ? 3'b001 : 3'b000; // SUB or ADD
                3'b010: ALU_Control = 3'b101; // SLT 
                3'b110: ALU_Control = 3'b011; // OR
                3'b111: ALU_Control = 3'b010; // AND
                default: ALU_Control = 3'b000; // Safe default prevents 'X'
            endcase
        end else begin
            ALU_Control = 3'b000; // Safe default prevents 'X'
        end
    end
endmodule