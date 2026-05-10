`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2026 15:25:23
// Design Name: 
// Module Name: Register_File
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


module Register_File(
input WE3, clk,
input [4:0] A1,A2,A3,
input [31:0] WD3,
output reg [31:0] RD1, 
output reg [31:0] RD2
    );
    
    reg [31:0] register_file[31:0];
    
    always@(posedge clk)
    if (WE3)
        register_file[A3] <= WD3;
    
    always @(*) begin
    if (A1 == 5'b00000) begin
        RD1 = 32'b0;          
    end else begin
        RD1 = register_file[A1];
    end
    if (A2 == 5'b00000) begin
        RD2 = 32'b0;         
    end else begin
        RD2 = register_file[A2];
    end
end
endmodule