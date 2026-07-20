`timescale 1ns / 1ps

module Datapath_tb;

    // 1. Inputs (Only the absolute basics to turn the chip on)
    reg clk;
    reg reset;

    // 2. Outputs (Observe the processor running)
    wire [31:0] instr; 
    wire zero;
    wire [31:0] pc_out;
    wire jump;
    wire branch;
    wire [31:0] WriteData;
    wire [31:0] ReadData;
    wire [31:0] ALUResult;
    wire [31:0] pc_in;
    wire [31:0] PCplus4;
    wire [31:0] PCTarget;
    wire [31:0] Result;
    wire [31:0] RD1;
    wire [31:0] SrcB;
    wire [31:0] ImmExt;
    wire PCSrc;
    wire ALUSrc;
    wire RegWrite;
    wire MemWrite;
    wire ResultSrc;
    wire [1:0] ImmSrc;
    wire [2:0] ALU_Control;

    // 3. Instantiate Datapath
    Data_Path dut (
        .clk(clk), 
        .reset(reset), 
        .instr(instr), 
        .zero(zero), 
        .pc_out(pc_out), 
        .jump(jump), 
        .branch(branch), 
        .WriteData(WriteData), 
        .ReadData(ReadData), 
        .ALUResult(ALUResult), 
        .pc_in(pc_in), 
        .PCplus4(PCplus4), 
        .PCTarget(PCTarget), 
        .Result(Result), 
        .RD1(RD1), 
        .SrcB(SrcB), 
        .ImmExt(ImmExt), 
        .PCSrc(PCSrc), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .MemWrite(MemWrite), 
        .ResultSrc(ResultSrc), 
        .ImmSrc(ImmSrc), 
        .ALU_Control(ALU_Control)
    );

    // 4. Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // 5. Stimulus
    initial begin
        $dumpfile("processor_waves.vcd");
        $dumpvars(0, Datapath_tb);
        
        // Assert reset to clear the PC
        reset = 1;
        #15;
        
        // Release reset. 
        // Notice all the "instr = ..." lines are GONE.
        // The processor now fetches them from its internal memory!
        reset = 0;

        // Just wait and let the processor run for 150ns 
        #150; 

        $finish;
    end
    
    initial begin
        $monitor("Time=%0t | PC=%h | Instr=%h | ALURes=%h | RegW=%b | Result=%h", 
                 $time, pc_out, instr, ALUResult, RegWrite, Result);
    end

endmodule