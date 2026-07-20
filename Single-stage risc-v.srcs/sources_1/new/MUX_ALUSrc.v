// Company: 
// Engineer: 
// 
// Create Date: 09.05.2026 16:44:10
// Design Name: 
// Module Name: MUX_ALUSrc
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
module MUX_ALUSrc(
    input wire [31:0] RD2,
    input wire [31:0] ImmExt,
    input wire ALUSrc,
    output reg [31:0] SrcB   // Changed to 'reg' for the always block
);
    always @(*) begin
        // Using strict 1'b1 prevents ternary X-corruption
        if (ALUSrc == 1'b1) begin
            SrcB = ImmExt;
        end else begin
            SrcB = RD2;      // Forces a clean read of RD2
        end
    end
endmodule