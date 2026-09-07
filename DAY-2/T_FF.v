module T_FF (
    input  wire clk,
    input  wire rst_n,
    input  wire t,
    output reg  data_out
);
    always @(posedge clk) begin
        if (!rst_n) begin
            data_out <= 1'b0;
        end 
        else if (t) begin
            data_out <= ~ data_out;
        end 
        else begin 
            data_out <= data_out;
        end
    end
endmodule