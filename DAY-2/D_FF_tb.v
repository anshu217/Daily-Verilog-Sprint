`timescale 1ns/1ps
`include "D_FF.v"
 
module d_ff_tb;
    reg clk;
    reg reset;
    reg d;
    wire q;
     
    d_ff DUT ( .clk(clk), .reset(reset), .d(d), .q(q));
    
    always #5 clk = ~clk;

    initial begin
        $dumpfile("D_FF.vcd");
        $dumpvars(0, d_ff_tb);
    end

    initial begin
        $display("--------------------------------------------------");
        $display("Time | clk | rst_n | in | out |");
        $display("--------------------------------------------------");
        $monitor("%4t | %b   | %b    | %b  | %b |", $time, clk, reset, d,q);
        clk = 0; reset = 0; d = 0 ; #5;
        reset = 1; d = 1; #10;
        reset = 0 ;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
    $finish;
    end
endmodule