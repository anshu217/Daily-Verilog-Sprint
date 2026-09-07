module mux_2to1 (
    input A, B, sel,
    output Y
);
    assign Y = sel ? B : A;
endmodule

module mux_4to1 (
    input A, B, C,D, 
    input S0,S1,
    output Y
);
    wire w1, w2;
    mux_2to1 m1 ( .A(A), .B(B), .sel(S1), .Y(w1));
    mux_2to1 m2 ( .A(C), .B(D), .sel(S1), .Y(w2));
    mux_2to1 m3 ( .A(w1), .B(w2), .sel(S0), .Y(Y));
endmodule