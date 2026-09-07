`timescale 1ns/1ps
`include "up_counter.v"

module up_counter_tb;
    reg clk, rst_n;
    wire [2:0] count;
    always #5 clk = ~clk;
    up_counter DUT ( .clk(clk), .rst_n(rst_n), .count(count));
    
    initial begin
        $dumpfile("up_counter.vcd");
        $dumpvars(0, up_counter_tb);
    end
    initial begin
        $display("--------------------------------------------------");
        $display("Time | clk rst_n | count |");
        $display("--------------------------------------------------");
        $monitor("%4t | %b |  %b  | %b |", $time, clk, rst_n, count);
        clk = 0 ; rst_n = 0 ; #10;
        rst_n = 1; #80;
    $finish;
    end
endmodule