// ANSHU KUMARI LE_01
module Half_Adder (
    input A , B ,
    output Sum, C_out);
    assign Sum = A ^ B ;
    assign C_out = A & B ;
endmodule
