`timescale 1ns/1ps
`include "JK_FF.v"
module JK_FF_tb;
    reg clk, rst_n, J,K;
    wire Qn ;
    JK_FF DUT (.clk(clk), .rst_n(rst_n), .J(J), .K(K), .Qn(Qn));
    always #5 clk = ~clk;
    initial begin
        $dumpfile("JK_FF.vcd");
        $dumpvars(0, JK_FF_tb);
    end
    initial begin
        $display("--------------------------------------------------");
        $display("Time | rst_n | clk |  J  |  K  | Qn |");
        $display("--------------------------------------------------");
        $monitor("%4t | %b   | %b    | %b  | %b  | %b |", $time, rst_n, clk,J,K,Qn);
        clk = 0; rst_n= 0; J = 0; K=0; #10;
        rst_n=1;
        {J,K} = 2'b00; #10;
        {J,K} = 2'b01; #10;
        {J,K} = 2'b10; #10;
        {J,K} = 2'b11; #10;
    $finish;
    end
endmodule
