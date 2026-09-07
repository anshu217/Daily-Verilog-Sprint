`timescale 1ns/1ps
`include "T_FF.v"
    
module T_FF_tb;
    reg clk;
    reg rst_n;
    reg t;
    wire data_out;
    
    T_FF DUT ( .clk(clk), .rst_n(rst_n), .data_out(data_out), .t(t));
    
    always #5  clk = ~clk;

    initial begin
        $dumpfile("T_FF.vcd");
        $dumpvars(0, T_FF_tb);
    end

    initial begin
        $display("--------------------------------------------------");
        $display("Time | rst_n | clk |  T  | out |");
        $display("--------------------------------------------------");
        $monitor("%4t | %b   | %b    | %b  | %b  |", $time, rst_n, clk,t,data_out);
        // 1. Initial State with Reset Active
        clk = 0;
        rst_n = 0;  // Reset active (clears to 0)
        t = 0;
        #10;

        // 2. Release Reset, keep T = 0 (Hold mode)
        rst_n = 1;
        t = 0;
        #20;        // Out should stay 0 across clock edges

        // 3. Enable Toggle (T = 1)
        t = 1;
        #20;        // Out should flip: 0 -> 1 -> 0 -> 1 on every posedge clk!

        // 4. Disable Toggle (Hold mode)
        t = 0;
        #20;
        $finish;
    end
endmodule