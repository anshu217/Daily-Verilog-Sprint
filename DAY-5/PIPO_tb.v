`timescale 1ns/1ps
`include "PIPO.v"

module PIPO_tb;
    reg clk, rst_n, load; 
    reg [3:0] d_in;
    wire [3:0] d_out;

    PIPO DUT ( .clk(clk), .rst_n(rst_n), .d_in(d_in), .d_out(d_out), .load(load) );
    
    always #5 clk = ~clk;
    initial begin
        $dumpfile("PIPO.vcd");
        $dumpvars(0, PIPO_tb);
    end
    initial begin
        $display("--------------------------------------------------");
        $display("Time | rst_n | clk |L/S| in | out |");
        $display("--------------------------------------------------");
        $monitor("%4t |  %b  |   %b  | %b | %b  |  %b |", $time, rst_n,clk, load, d_in, d_out);
        clk = 1; rst_n = 0; load = 1; d_in = 4'b1001; #10;
        rst_n = 1;
        load = 1; d_in = 4'b1001; #10;
        load = 0; #10;
    $finish;
    end
endmodule