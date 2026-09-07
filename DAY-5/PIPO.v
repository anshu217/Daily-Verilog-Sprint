module PIPO ( 
    input clk, rst_n, load,
    input [3:0] d_in,
    output reg [3:0] d_out
);
    always @(posedge clk) begin
        if (!rst_n) begin
            d_out <= 4'b0000;
        end else if (load == 1) begin
            d_out <= d_in; 
        end
    end
endmodule