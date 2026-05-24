module Full_Adder (
    input A, B,C_in,
    output Sum, C_out
);
    assign Sum = A^B^C_in;
    assign C_out= A&B | B&C_in | C_in&A;
endmodule