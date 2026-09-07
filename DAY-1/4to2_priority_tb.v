`include "4to2_priority.v"
`timescale 1ns/1ps

module priority_encoder_tb;
    reg [3:0] D;
    wire valid;
    wire [1:0] Y;

    priority_encoder DUT ( .D(D), .Y(Y), .valid(valid));
    initial begin
        $dumpfile("4to2_priority.vcd");
        $dumpvars(0,priority_encoder_tb);
    end
    initial begin
        $display("|D3|D2|D1|D0|Y1|Y0|V |");
        $monitor("|%b |%b |%b |%b |%b |%b |%b |", D[3],D[2],D[1],D[0], Y[1],Y[0],valid);
        D = 4'b0000; #10;
        D = 4'b0001; #10;
        D = 4'b001x; #10;
        D = 4'b01xx; #10;
        D = 4'b1xxx; #10;    
        $finish;
    end
endmodule