///////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 11:03:06
// Design Name: 
// Module Name: PCTarget
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


module PCTarget(
input [31:0]ImmExt,
input [31:0]pc_out,
output [31:0]PCTarget
    );
    assign PCTarget = ImmExt+pc_out;
endmodule
