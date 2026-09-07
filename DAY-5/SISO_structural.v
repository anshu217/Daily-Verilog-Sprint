module D_FF(
    input clk, d,rst_n,
    output reg q
);
    always @(posedge clk) begin
        if (!rst_n) begin
            q <= 'd0;
        end else begin
            q <= d;
        end
    end
endmodule
module SISOs (
    input clk, rst_n,
    input wire data_in,
    output wire data_out
);
    wire  w1,w2,w3;
    D_FF D3 (.clk(clk), .rst_n(rst_n), .d(data_in), .q(w1));
    D_FF D2 (.clk(clk), .rst_n(rst_n), .d(w1), .q(w2));
    D_FF D1 (.clk(clk), .rst_n(rst_n), .d(w2), .q(w3));
    D_FF D0 (.clk(clk), .rst_n(rst_n), .d(w3), .q(data_out));
endmodule