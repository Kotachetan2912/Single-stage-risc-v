// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 01:42:11
// Design Name: 
// Module Name: MUX_ResultSrc
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

module MUX_ResultSrc(
input [31:0] ALUResult,
input [31:0] ReadData,
input ResultSrc,
output reg [31:0] Result
    );
    always @(*) begin
    if(ResultSrc)
    Result = ReadData;
    else
    Result = ALUResult;
    end
endmodule