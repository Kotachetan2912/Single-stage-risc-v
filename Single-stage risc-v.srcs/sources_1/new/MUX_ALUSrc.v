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
input RD2, ImmExt, ALUSrc,
output SrcB
    );
    assign SrcB = ALUSrc?ImmExt:RD2; 
endmodule