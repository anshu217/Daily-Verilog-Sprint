`timescale 1ps/1ps
`include "practical1.v"
module Half_Adder_tb; 
    reg A, B;
    wire Sum, C_out;
    
    Half_Adder HA1(.A(A), .B(B), .Sum(Sum), .C_out(C_out));
    
    initial begin
        $dumpfile("Half_Adder_tb.vcd");
        $dumpvars(0, Half_Adder_tb);
        
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        
        $finish;
    end
endmodule
