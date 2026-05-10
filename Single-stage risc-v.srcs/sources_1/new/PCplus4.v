// Company: 
// Engineer: 
// 
// Create Date: 09.05.2026 15:10:33
// Design Name: 
// Module Name: PCplus4
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

module PCplus4(
input [31:0]pc_out,
output [31:0]PCplus4
    );
    assign PCplus4 = pc_out + 32'd4;
endmodule
