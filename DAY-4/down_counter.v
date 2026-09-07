module down_counter(
    input clk,
    input rst_n,
    output reg [2:0] count
);
    always @(posedge clk) begin
        if (!rst_n) begin
            count <= 'd0;
        end else begin
            count <= count - 1;
        end
    end
endmodule