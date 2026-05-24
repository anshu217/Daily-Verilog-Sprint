`timescale 1ns/1ps
`include "Full_Adder.v"

module Full_Adder_tb ;
    reg A, B,C_in;
    wire Sum, C_out;

    Full_Adder DUT (.A(A), .B(B), .C_in(C_in), .Sum(Sum), .C_out(C_out));

    initial begin
    $dumpfile("full_adder_sim.vcd");
    $dumpvars(0, Full_Adder_tb); 
    end

    initial begin
    A = 0; B = 0; C_in = 0;#10; 
    A = 0; B = 0; C_in = 1;#10;
    A = 0; B = 1; C_in = 0;#10; 
    A = 0; B = 1; C_in = 1;#10; 
    A = 1; B = 0; C_in = 0;#10; 
    A = 1; B = 0; C_in = 1;#10; 
    A = 1; B = 1; C_in = 0;#10; 
    A = 1; B = 1; C_in = 1;#10;

    $display("Full Adder Simulation Complete!");
    $finish;
    end
endmodule 