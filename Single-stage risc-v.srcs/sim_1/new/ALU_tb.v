module ALU_tb();
    reg [31:0] RD1;
    reg [31:0] SrcB;        // FIXED: Matched name to module
    reg [2:0]  ALUControl;  // FIXED: Matched name to module
    wire zero;
    wire [31:0] ALUResult;
    
    ALU dut (
        .RD1(RD1),
        .RD2(SrcB),              // FIXED
        .ALUControl(ALUControl),  // FIXED
        .zero(zero),
        .ALUResult(ALUResult)
    );

    initial begin
        RD1 = 32'd15; SrcB = 32'd10; ALUControl = 3'b000;
        #10;
        RD1 = 32'd20; SrcB = 32'd5; ALUControl = 3'b001;
        #10;        
        RD1 = 32'h0000_FFFF; SrcB = 32'hFFFF_00FF; ALUControl = 3'b010;
        #10;
        RD1 = 32'h0000_FFFF; SrcB = 32'hFFFF_0000; ALUControl = 3'b011;
        #10;
        RD1 = 32'd10; SrcB = 32'd50; ALUControl = 3'b101;
        #10;
        RD1 = 32'd100; SrcB = 32'd50; ALUControl = 3'b101;
        #10;    
        RD1 = 32'd20; SrcB = 32'd50; ALUControl = 3'b011;
        #10;
        RD1 = 32'd50; SrcB = 32'd50; ALUControl = 3'b000;
        #10;
        
        $finish;
    end                                
endmodule