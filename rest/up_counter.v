/* Design a 4-bit binary up-counter that counts from 0000 (4'd0) to 1111 (4'd15) 
and wraps around to 0000.*/

module up_counter (
    input clk , enable, rst
    output reg  [3:0] count
    );
    always @(enable) begin
        if (rst) begin
            count<= 4'b0000;
        end
        else if (clk) begin
            count <= count + 1;
        end
    end