
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2026 14:51:05
// Design Name: 
// Module Name: PC_tb
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

module PC_tb;

    // Inputs
    reg clk;
    reg reset;
    reg [31:0] pc_in;
    reg [31:0] start_add;

    // Outputs
    wire [31:0] pc_out;

    // Instantiate the module under test
    Program_counter dut (
        .start_add(start_add),
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Clock generation
    always begin
        clk = 0;
        #5;  
        clk = 1;
        #5;  
    end

    
    initial begin
        // Initialize inputs
        start_add = 32'h00001000;
        reset = 1;
        pc_in = 32'h00000000;  
        #10;

        reset = 0;
        #10;
        pc_in = 32'h00000004;
        #10;
        pc_in = 32'h00000008;
        #10;
        pc_in = 32'h0000000C;
        #10;
        $finish;
    end

endmodule