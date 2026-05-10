// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 11:08:45
// Design Name: 
// Module Name: PCTarget_tb
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


module PCTarget_tb();
reg [31:0]ImmExt;
reg [31:0]pc_out;
wire [31:0]PCTarget;

PCTarget dut (
        .ImmExt(ImmExt),
        .pc_out(pc_out),
        .PCTarget(PCTarget)
    );initial begin
    pc_out = 32'h0; 
    ImmExt = 32'h0;
    #10;
    pc_out = 32'h0000_1000; 
    ImmExt = 32'h0000_0004;
    #10; 
    pc_out = 32'h0000_1010;
    ImmExt = 32'hFFFF_FFF4; 
    #10;
    $finish;
end
endmodule
