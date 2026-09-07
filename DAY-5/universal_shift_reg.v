module universal_shift_reg ( 
    input clk, rst_n,s_in_r,s_in_l,
    input [1:0] sel,
    input [3:0] d_in,
    output reg [3:0] d_out
);
    always @(posedge clk) begin
        if (!rst_n) begin
            d_out <= 4'b0000;
        end else begin
            case(sel)
                2'b00  : d_out <= d_out; 
                2'b01  : d_out <= {s_in_r,d_out[3:1]} ; 
                2'b10  : d_out <= {d_out[2:0], s_in_l} ; 
                2'b11  : d_out <= d_in; 
            endcase
        end 
    end
endmodule