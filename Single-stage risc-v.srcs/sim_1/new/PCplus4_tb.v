// Engineer: 
// 
// Create Date: 09.05.2026 15:12:02
// Design Name: 
// Module Name: PCplus4_tb
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



module PCplus4_tb;
reg [31:0]pc_out;
wire [31:0]PCplus4;

PCplus4 dut (
        .pc_out(pc_out),
        .PCplus4(PCplus4)
    );

initial begin 
pc_out = 32'h0000_0000;
#10;
pc_out=32'h0000_0004; 
#10;
pc_out = 32'h0000_1000; 
#10;
pc_out = 32'hFFFF_FFFC; 
#10;
#10 $finish();
end

endmodule
