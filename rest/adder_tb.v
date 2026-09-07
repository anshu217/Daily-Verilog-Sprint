`timescale 1ns/1ps
`include "adder.v"

module tb_half_adder;
    reg a, b;
    wire sum, carry;

    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("half_adder_result.vcd"); // The file GTKWave will open
        $dumpvars(0, tb_half_adder);     // Dump all signals in this module
    end

    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $display("Simulation Finished");
        $finish;
    end
endmodule