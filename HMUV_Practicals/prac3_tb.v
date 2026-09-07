`timescale 1ns/1ps
`include "prac3.v"
module tb_Ripple_Carry_Adder;
    reg [3:0] A; 
    reg [3:0] B; 
    reg Cin;     
    wire [3:0] Sum; 
    wire Cout;   

    Ripple_Carry_Adder rca (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    initial begin
        $dumpfile("prac3_tb.vcd");
        $dumpvars(0, tb_Ripple_Carry_Adder);
        // Test case 1
        A = 4'b0001; B = 4'b0010; Cin = 1'b0;
        #10;
        $display("Test case 1: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        // Test case 2
        A = 4'b1111; B = 4'b0001; Cin = 1'b0;
        #10;
        $display("Test case 2: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        // Test case 3
        A = 4'b1010; B = 4'b0101; Cin = 1'b1;
        #10;
        $display("Test case 3: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        // Test case 4
        A = 4'b1111; B = 4'b1111; Cin = 1'b1;
        #10;
        $display("Test case 4: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        $finish;
    end
endmodule
