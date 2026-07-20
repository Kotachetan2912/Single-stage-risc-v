module Program_counter(
    input clk, 
    input reset, 
    input [31:0] pc_in,
    output reg [31:0] pc_out 
);
    always @(posedge clk) begin
        if (reset) begin
            pc_out <= 32'b0; // Safely forces the PC to 0 on reset!
        end else begin
            pc_out <= pc_in; 
        end
    end
endmodule