`timescale 1ns/1ps
`include "mux_2to1.v"
module mux_2to1_tb ;
    reg t_A, t_B, t_S;
    wire t_Y;
    mux_2to1 DUT ( .A(t_A), .B(t_B), .S(t_S), .Y(t_Y) );
    
    initial begin 
    $dumpfile ("mux_2to1.vcd");
    $dumpvars (0, mux_2to1_tb);
    end

    initial begin
    $display ("|A|B|S|Y|");
    $monitor ("|%b|%b|%b|%b|",t_A,t_B,t_S,t_Y);
    t_S = 1'b0 ; t_A = 1'b1 ; t_B = 1'b0 ; #10
    t_S = 1'b1 ; t_A = 1'b0 ; t_B = 1'b1 ; #10
    $finish;
    end
endmodule

