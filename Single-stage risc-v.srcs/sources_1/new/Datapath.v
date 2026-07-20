
module Data_Path(
    input clk, reset,
    output wire zero,
    output wire [31:0] pc_out,
    output wire jump, branch,
    output wire [31:0] WriteData,
    output wire [31:0] ReadData,
    output wire [31:0] ALUResult,
    output wire [31:0] pc_in, PCplus4, PCTarget, Result, RD1, SrcB, ImmExt,
    output wire [31:0] instr,      // CHANGED: Now an output wire!
    output wire PCSrc, ALUSrc, RegWrite, MemWrite,
    output wire ResultSrc,    
    output wire [1:0] ImmSrc,
    output wire [2:0] ALU_Control  
);

    // PC Logic flow
    Program_counter pc(.clk(clk), .reset(reset), .pc_in(pc_in), .pc_out(pc_out));
    PCplus4 a1(.pc_out(pc_out), .PCplus4(PCplus4));
    PCTarget a2(.ImmExt(ImmExt), .pc_out(pc_out), .PCTarget(PCTarget));
    MUX_PCSrc m1(.PCplus4(PCplus4), .PCTarget(PCTarget), .PCSrc(PCSrc), .pc_in(pc_in));
    
    // Instruction memory 
    // FIXED: Re-instantiated inside the datapath!
    Instruction_Memory im(.pc_out(pc_out), .instr(instr)); 
    
    // Register File Logic Flow
    Register_File rf(.WE3(RegWrite), .clk(clk), .A1(instr[19:15]), .A2(instr[24:20]), .A3(instr[11:7]), .WD3(Result), .RD1(RD1), .RD2(WriteData));
    Extend e(.instr(instr[31:7]), .ImmSrc(ImmSrc), .ImmExt(ImmExt));
    
    // ALU Logic
    MUX_ALUSrc m2(.RD2(WriteData), .ImmExt(ImmExt), .ALUSrc(ALUSrc), .SrcB(SrcB));
    ALU alu(.RD1(RD1), .SrcB(SrcB), .ALUControl(ALU_Control), .zero(zero), .ALUResult(ALUResult)); 
    
    // Data Memory Logic
    Data_Mem dm(.clk(clk), .MemWrite(MemWrite), .ALUResult(ALUResult), .RD2(WriteData), .ReadData(ReadData));
    
    // MUX for ResultSrc 
    MUX_ResultSrc m3(.ALUResult(ALUResult), .ReadData(ReadData), .ResultSrc(ResultSrc), .Result(Result)); 
    
    // Control unit
    ALUControl cu(
        .op(instr[6:0]), 
        .funct3(instr[14:12]), 
        .funct7(instr[31:25]), 
        .zero(zero), 
        .PCSrc(PCSrc), 
        .ALUSrc(ALUSrc), 
        .ResultSrc(ResultSrc), 
        .RegWrite(RegWrite), 
        .MemWrite(MemWrite), 
        .ImmSrc(ImmSrc), 
        .ALU_Control(ALU_Control),
        .jump(jump),
        .branch(branch)
    );
endmodule