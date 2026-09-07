`timescale 1ns/1ps
`include "universal_shift_reg.v"

module universal_shift_reg_tb;
    reg clk, rst_n, s_in_r, s_in_l; 
    reg [3:0] d_in;
    reg [1:0] sel;
    wire [3:0] d_out;

    universal_shift_reg DUT ( .clk(clk), .rst_n(rst_n), .d_in(d_in), .d_out(d_out), .s_in_r(s_in_r), .s_in_l(s_in_l), .sel(sel) );
    
    always #5 clk = ~clk;
    initial begin
        $dumpfile("universal_shift_reg.vcd");
        $dumpvars(0, universal_shift_reg_tb);
    end
    initial begin
        $display("---------------------------------------------------------------");
        $display("Time | rst_n | sel | s_r | s_l |  d_in  |  q_out | Operation");
        $display("---------------------------------------------------------------");
        $monitor("%4t |   %b   |  %b |  %b |  %b  |  %b  |  %b  |", 
                 $time, rst_n, sel, s_in_r, s_in_l, d_in, d_out);
        clk = 0; rst_n = 0; sel = 2'b00;
        s_in_r = 0; s_in_l = 0; d_in = 4'b0000;
        #12;
        rst_n = 1; #8;
        sel = 2'b11; d_in = 4'b1010; #10; // parallel load
        sel = 2'b00; d_in = 4'b0000; #20; //hold
        sel = 2'b01; s_in_r = 1; #10;//shift Right
        sel = 2'b10; s_in_l = 1; #10;//SHift left
        sel = 2'b11; d_in = 4'b1100; #10; //Parallel Load again
        $finish;
    end
endmodule