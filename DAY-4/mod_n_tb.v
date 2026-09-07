`timescale 1ns/1ps
`include "mod_n.v"
module mod_n_counter_tb;
    reg clk, rst_n;
    reg [3:0]N;
    wire [3:0] count;
    always #5 clk = ~clk;
    
    mod_n_counter DUT ( .clk(clk), .rst_n(rst_n), .count(count), .N(N));
    
    initial begin
        $dumpfile("mod_n_counter.vcd");
        $dumpvars(0, mod_n_counter_tb);
    end
    initial begin
        $display("--------------------------------------------------");
        $display("Time | clk | rst_n | count |");
        $display("--------------------------------------------------");
        $monitor("%4t | %b |  %b  | %b |", $time, clk, rst_n, count);
        clk = 0 ; rst_n = 0 ; #10; 
        N = 10; rst_n = 1; #100;
    $finish;
    end
endmodule