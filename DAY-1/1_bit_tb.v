`timescale 1ns/1ps
`include "1_bit.v"
module comparator_tb;
    reg A, B;
    wire X,Y,Z;
    comparator DUT ( .A(A),.B(B),.X(X),.Y(Y),.Z(Z));

    initial begin
        $dumpfile("1_bit.vcd;");
        $dumpvars(0, comparator_tb);
    end

    initial begin
        $display("|A|B|X|Y|Z|");
        $monitor("|%b|%b|%b|%b|%b|",A,B,X,Y,Z);
        {A,B} = 2'b00 ; #10;
        {A,B} = 2'b01 ; #10;
        {A,B} = 2'b10 ; #10;
        {A,B} = 2'b11 ; #10;
        $finish;
    end
endmodule