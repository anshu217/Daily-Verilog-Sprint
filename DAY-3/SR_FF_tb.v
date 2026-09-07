`timescale 1ns/1ps
`include "SR_FF.v"
module SR_FF_tb;
    reg clk, rst_n, S,R;
    wire Qn ;
    SR_FF DUT (.clk(clk), .rst_n(rst_n), .S(S), .R(R), .Qn(Qn));
    always #5 clk = ~clk;
    initial begin
        $dumpfile("SR_FF.vcd");
        $dumpvars(0, SR_FF_tb);
    end
    initial begin
        $display("--------------------------------------------------");
        $display("Time | rst_n | clk |  S  |  R  | Qn |");
        $display("--------------------------------------------------");
        $monitor("%4t | %b   | %b    | %b  | %b  | %b |", $time, rst_n, clk,S,R,Qn);
        clk = 0; rst_n= 0; S = 0; R=0; #10;
        rst_n=1;
        {S,R} = 2'b00; #10;
        {S,R} = 2'b01; #10;
        {S,R} = 2'b10; #10;
        {S,R} = 2'b11; #10;
    $finish;
    end
endmodule
