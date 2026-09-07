module PISO ( 
    input clk, rst_n, load,
    input [3:0] d_in,
    output reg d_out

);
    reg [3:0] shift ;
    always @(posedge clk) begin
        if (!rst_n) begin
            shift <= 4'b0000;
        end else if (load == 1) begin
            shift <= d_in; 
        end else begin 
            shift <= {1'b0,shift [3:1]};
        end
        d_out <= shift[0];
    end
endmodule
