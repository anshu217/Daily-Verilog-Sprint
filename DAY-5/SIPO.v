module SIPO (
    input clk, rst_n, d_in,
    output reg [3:0] d_out
);
    always @(posedge clk) begin
        if (!rst_n) begin
            d_out <= 'd0;
        end else begin
            d_out <= {d_in, d_out[3:1]};
        end
    end
endmodule