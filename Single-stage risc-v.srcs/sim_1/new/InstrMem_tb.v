// Company: 
// Engineer: 
// 
// Create Date: 08.05.2026 20:50:06
// Design Name: 
// Module Name: InstrMem_tb
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


module InstrMem_tb;
    reg [31:0] pc_out;
    wire [31:0] instr;
    Instruction_Memory dut (
        .pc_out(pc_out),
        .instr(instr)
    );

    initial begin
        pc_out = 32'h00000000;
        #10;
        pc_out = 32'h00000004;
        #10; 
        pc_out = 32'h00000008;
        #10; 
        pc_out = 32'h0000000C;
        #10; 
        $finish;
    end

endmodule