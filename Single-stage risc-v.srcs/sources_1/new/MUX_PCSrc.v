// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 11:37:52
// Design Name: 
// Module Name: MUX_PCSrc
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


module MUX_PCSrc(
input [31:0]PCplus4,
input [31:0]PCTarget,
input PCSrc,
output [31:0]pc_in
    );
assign pc_in = (PCSrc)?PCTarget:PCplus4;
endmodule
