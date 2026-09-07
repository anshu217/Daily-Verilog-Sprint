`timescale 1ns/1ps
`include "mux_4to1.v"
module mux_4to1_tb;
    reg A, B, C,D, S0,S1;
    wire Y;
    integer i ;

    mux_4to1 DUT ( .A(A), .B(B), .C(C), .D(D), .S0(S0), .S1(S1), .Y(Y));

    initial begin 
    $dumpfile ("mux_4to1.vcd");
    $dumpvars (0, mux_4to1_tb);
    end

    initial begin
        $display ("|S0|S1|A|B|C|D|Y|");
        $monitor ("|%b |%b |%b|%b|%b|%b|%b",S0,S1,A,B,C,D,Y);

        {A,B,C,D} = 4'b1010;
        for (i=0; i<4; i=i+1) begin
            {S0, S1} = i[1:0]; #10;
        end

        {A,B,C,D} = 4'b0101;
        for (i=0; i<4; i=i+1) begin
            {S0, S1} = i[1:0]; #10;
        end
        $finish;
    end
endmodule

        /*{S0,S1} =2'b00; #10;
        {S0,S1} =2'b01; #10;
        {S0,S1} =2'b10; #10;
        {S0,S1} =2'b11; #10;
        {A,B,C,D} = 4'b0101;
        repeat(12) begin
            {S0, S1} = $random;
            #5;
        end*/
