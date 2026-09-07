module JK_FF (
    input clk, rst_n, J,K,
    output reg Qn
);
    always @(posedge clk) begin
        if(!rst_n) begin
            Qn <= 'd0;
        end
        else begin
            case ({J,K})
                2'b00 : Qn <= Qn;
                2'b01 : Qn <= 1'b0 ;
                2'b10 : Qn <= 1'b1 ;
                2'b11 : Qn <= ~Qn ;
            endcase
        end
    end
endmodule