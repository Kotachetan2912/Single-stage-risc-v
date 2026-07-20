// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 17:11:51
// Design Name: 
// Module Name: DataMem_tb
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


module DataMem_tb();
reg [31:0]ALUResult;
reg [31:0]RD2;
reg clk;
reg MemWrite;
wire [31:0]ReadData;

Data_Mem dut(
        .ALUResult(ALUResult),
        .RD2(RD2),
        .clk(clk),
        .MemWrite(MemWrite),
        .ReadData(ReadData)
    );
    always #5 clk = ~clk;
    initial begin
    clk = 0;
    ALUResult =0;
    RD2 = 0;
    MemWrite = 0;
   #12; // Wait past first clock edge
        ALUResult = 32'h0000_0008; // Word address 2 (8/4)
        RD2 = 32'h0001_4300;       // Data to write
        MemWrite = 1;              // Enable writing
        #10;
        MemWrite = 0;
        ALUResult = 32'h0000_0008;
        #10;
        ALUResult = 32'h0000_0010;
        RD2 = 32'hCAFE_F00D;
        MemWrite =1;
        #10;
        MemWrite =0;
        #10;
        $finish;
        end
endmodule
