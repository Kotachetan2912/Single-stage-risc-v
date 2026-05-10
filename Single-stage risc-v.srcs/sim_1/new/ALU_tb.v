`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 15:48:12
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
 reg [31:0] RD1;
 reg [31:0] RD2;
 reg [2:0]  ALUControl;
    wire zero;
    wire[31:0] ALUResult;
    
ALU dut (
        .RD1(RD1),
        .RD2(RD2),
        .ALUControl(ALUControl),
        .zero(zero),
        .ALUResult(ALUResult)
    );
initial begin
RD1 = 32'd15; RD2 = 32'd10; ALUControl = 3'b000;
        #10;
RD1 = 32'd20; RD2 = 32'd5; ALUControl = 3'b001;
        #10;        
RD1 = 32'h0000_FFFF; RD2 = 32'hFFFF_00FF; ALUControl = 3'b010;
        #10;
RD1 = 32'h0000_FFFF; RD2 = 32'hFFFF_0000; ALUControl = 3'b011;
        #10;
RD1 = 32'd10; RD2 = 32'd50; ALUControl = 3'b101;
        #10;
RD1 = 32'd100; RD2 = 32'd50; ALUControl = 3'b101;
        #10;    
    $finish;
end                            
endmodule
