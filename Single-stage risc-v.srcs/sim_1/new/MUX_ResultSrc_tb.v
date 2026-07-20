// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 01:47:53
// Design Name: 
// Module Name: MUX_ResultSrc_tb
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

module MUX_ResultSrc_tb();

     reg [31:0] ALUResult;
    reg [31:0] ReadData;
    reg ResultSrc;
    wire [31:0] Result;

    MUX_ResultSrc dut (
        .ALUResult(ALUResult), 
        .ReadData(ReadData), 
        .ResultSrc(ResultSrc), 
        .Result(Result)
    );
    initial begin
    ALUResult = 32'hAAAAAAAA; // Pattern of 1010...
        ReadData  = 32'h55555555; // Pattern of 0101...
        ResultSrc = 0;
        #100;
        ResultSrc = 0;
        #20;
        ResultSrc = 1;
        #20;
        ResultSrc = 0;
        ALUResult = 32'h12345678;
        #20;
        $finish;
        end
    endmodule
