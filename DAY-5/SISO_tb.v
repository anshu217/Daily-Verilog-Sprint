`timescale 1ns/1ps
`include "SISO.v"

module SISO_tb;
    reg clk, rst_n, d_in;
    wire d_out;

    SISO DUT ( .clk(clk), .rst_n(rst_n), .d_in(d_in), .d_out(d_out) );
    
    always #5 clk = ~clk;
    initial begin
        $dumpfile("SISO.vcd");
        $dumpvars(0, SISO_tb);
    end
    initial begin
        $display("--------------------------------------------------");
        $display("Time | clk | rst_n | in | out");
        $display("--------------------------------------------------");
        $monitor("%4t | %b   |   %b  | %b  | %b | %b |", $time, clk, rst_n, d_in, DUT.shift, d_out);
        clk = 0; rst_n = 0; #10;
        rst_n = 1;
        d_in = 1; #10;
        d_in = 0; #10;
        d_in = 1; #10;
        d_in = 0; #10;
    #40;
    $finish;
    end
endmodule