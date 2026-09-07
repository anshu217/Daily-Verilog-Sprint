`include "8bit_ALU.v"
`timescale 1ps/1ps

module Test_ALU_8bit;
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] Opcode;
    wire [7:0] Y;
    wire carry; 
    wire Zero_flag;
    wire Overflow_flag;
    ALU_8bit DUT ( .A(A), .B(B), .Opcode(Opcode), .Y(Y), .carry(carry), .Zero_flag(Zero_flag), .Overflow_flag(Overflow_flag)  );
    
    initial begin
        $dumpfile ("result_ALU.vcd");
        $dumpvars (0, Test_ALU_8bit);
    end

    initial begin
    Opcode = 4'b0000; A = 8'd50;       B = 8'd30;       #10;
    $display("ADD    : %0d + %0d = %0d | carry=%b | zero=%b", A, B, Y, carry, Zero_flag);

    Opcode = 4'b0000; A = 8'hFF;       B = 8'h01;       #10;
    $display("ADD    : %0d + %0d = %0d | carry=%b | zero=%b", A, B, Y, carry, Zero_flag);

    Opcode = 4'b0001; A = 8'd100;      B = 8'd50;       #10;
    $display("SUB    : %0d - %0d = %0d | carry=%b | zero=%b", A, B, Y, carry, Zero_flag);

    Opcode = 4'b0001; A = 8'd50;       B = 8'd50;       #10;
    $display("SUB    : %0d - %0d = %0d | carry=%b | zero=%b", A, B, Y, carry, Zero_flag);

    Opcode = 4'b0010; A = 8'b11110000; B = 8'b10101010; #10;
    $display("AND    : %b & %b = %b", A, B, Y);

    Opcode = 4'b0011; A = 8'b11110000; B = 8'b10101010; #10;
    $display("OR     : %b | %b = %b", A, B, Y);

    Opcode = 4'b0100; A = 8'b11110000; B = 8'b10101010; #10;
    $display("XOR    : %b ^ %b = %b", A, B, Y);

    Opcode = 4'b0101; A = 8'b10101010; B = 8'b0;        #10;
    $display("NOT    : ~%b = %b", A, Y);

    Opcode = 4'b0110; A = 8'd50;       B = 8'b0;        #10;
    $display("INC    : %0d + 1 = %0d | carry=%b", A, Y, carry);

    Opcode = 4'b0110; A = 8'hFF;       B = 8'b0;        #10;
    $display("INC    : %0d + 1 = %0d | carry=%b", A, Y, carry);

    Opcode = 4'b0111; A = 8'd50;       B = 8'b0;        #10;
    $display("DEC    : %0d - 1 = %0d | carry=%b", A, Y, carry);

    Opcode = 4'b1000; A = 8'b10000001; B = 8'b0;        #10;
    $display("LSHIFT : %b << 1 = %b | carry=%b", A, Y, carry);

    Opcode = 4'b1001; A = 8'b10000001; B = 8'b0;        #10;
    $display("RSHIFT : %b >> 1 = %b | carry=%b", A, Y, carry);

    $display("ALU simulation done");
    $finish;
end
endmodule