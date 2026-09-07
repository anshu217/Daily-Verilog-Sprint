`timescale 1ns/1ps
`include "down_counter.v"

module down_counter_tb;
    reg clk, rst_n;
    wire [2:0] count;
    always #5 clk = ~clk;
    down_counter DUT ( .clk(clk), .rst_n(rst_n), .count(count));
    
    initial begin
        $dumpfile("down_counter.vcd");
        $dumpvars(0, down_counter_tb);
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