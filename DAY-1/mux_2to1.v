module mux_2to1 (
    input A, B, S,
    output Y
);
    assign Y = S ? B : A ;
endmodule

/* using if-else
if ( S == 1'b0 ) begin 
    assign Y = A;
    end
    else begin 
    assign Y = B;
    end

 assign Y = (~S &  A ) | (S & B) ; // Boolean

always @(*)begin
case(S) // using case 
1'b0 : Y = A ;
1'b1 : Y = B ;
default : Y = 1'b0
endcase
end
*/