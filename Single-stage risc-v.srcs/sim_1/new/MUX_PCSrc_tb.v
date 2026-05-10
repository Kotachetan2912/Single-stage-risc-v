`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 11:49:23
// Design Name: 
// Module Name: MUX_PCSrc_tb
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


module MUX_PCSrc_tb(    );
reg [31:0]PCplus4;
reg [31:0]PCTarget;
reg PCSrc;
wire [31:0]pc_in;

MUX_PCSrc dut(.PCplus4(PCplus4),.PCTarget(PCTarget),.PCSrc(PCSrc),.pc_in(pc_in));
initial begin
PCplus4  = 32'h0000_1004; 
PCTarget = 32'h0000_2040; 
PCSrc    = 1'b0;
#10; 
PCSrc = 1'b1;
#10;
PCSrc= 1'b0;
 #10;
PCplus4  = 32'h0000_1008; 
#10;
PCSrc    = 1'b1;
#10;
PCTarget = 32'h0000_3000; 
#10;
$finish;
end
endmodule
