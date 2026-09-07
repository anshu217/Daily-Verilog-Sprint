`timescale 1ns/1ps
`include "SIPO.v"

module SIPO_tb;
    reg clk, rst_n, d_in;
    wire [3:0] d_out;

    SIPO DUT ( .clk(clk), .rst_n(rst_n), .d_in(d_in), .d_out(d_out) );
    
    always #5 clk = ~clk;
    initial begin
        $dumpfile("SIPO.vcd");
        $dumpvars(0, SIPO_tb);
    end
    initial begin
        $display("--------------------------------------------------");
        $display("Time | rst_n | clk | in | out");
        $display("--------------------------------------------------");
        $monitor("%4t |  %b  |   %b  | %b | %b |", $time, rst_n,clk,  d_in, d_out);
        clk = 1; rst_n = 0; d_in=1; #15;
        rst_n = 1;
        d_in = 1; #10;
        d_in = 0; #10;
        d_in = 0; #10;
        d_in = 1; #10;
    $finish;
    end
endmodule