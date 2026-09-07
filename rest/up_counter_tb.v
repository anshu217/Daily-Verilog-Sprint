`timescale 1ns/1ps
`include "up_counter.v"

module up_counter_tb;
    reg clk, enable, rst;
    wire [3:0] count;

    up_counter uut (
        .clk(clk),
        .enable(enable),
        .rst(rst),
        .count(count)
    );
    
    initial begin
    $dumpfile("up_counter_sim.vcd");
    $dumpvars(0, up_counter_tb); 
    end
    initial begin
        clk = 0; enable = 0; rst = 1; #10;
        rst = 0; enable = 1; #10;
        repeat (20) begin
            clk = ~clk; #5;
        end
        $display("Up Counter Simulation Complete!");
        $finish;
    end
endmodule