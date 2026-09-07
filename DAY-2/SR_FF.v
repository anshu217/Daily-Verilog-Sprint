module SR_FF (
    input clk, rst_n, S,R,
    output reg Qn
);
    always @(posedge clk) begin
        if(!rst_n) begin
            Qn <= 'd0;
        end
        else begin
            case ({S,R})
                2'b00 : Qn <= Qn;
                2'b01 : Qn <= 1'b0 ;
                2'b10 : Qn <= 1'b1 ;
                2'b11 : Qn <= 1'bx ;
            endcase
        end
    end
endmodule