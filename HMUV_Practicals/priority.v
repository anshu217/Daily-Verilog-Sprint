/* Build a priority encoder for 8-bit input. If multiple bits are set, 
output the position of the highest set bit. If no bits set, output 0.*/
module top_module(
    input [7:0] in,
    output reg [2:0] out
);
    case (in)
        8'b00000000 : out = 3'b000;
        8'b00000001 : out = 3'b001;
        8'b0000001? : out = 3'b010;
        8'b000001?? : out = 3'b011;
        8'b00001??? : out = 3'b100;
        8'b0001???? : out = 3'b101;
        8'b001????? : out = 3'b110;
        8'b01?????? : out = 3'b111;
        default : out = 3'b0
    endcase
endmodule