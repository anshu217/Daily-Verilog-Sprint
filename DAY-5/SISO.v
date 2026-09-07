module SISO ( 
    input clk, rst_n, d_in,
    output reg d_out
);
    reg [3:0] shift ;
    always @(posedge clk) begin
        if (!rst_n) begin
            shift <= 4'b0000;
        end else begin
            shift <= { d_in, shift[3:1]}; 
        end
        d_out <= shift [0];
    end
endmodule
