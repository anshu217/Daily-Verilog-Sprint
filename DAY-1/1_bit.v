module comparator (
    input  wire A, B,
    output X,Y,Z
);
assign X = (A>B);
assign Y = (A<B);
assign Z = (A==B);
//     assign X = (A & ~B);
//     assign Y = (~A & B);
//     assign Z = (A ^ ~B);
endmodule