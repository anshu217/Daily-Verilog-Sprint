module ALU_8bit (
    input [7:0] A,
    input [7:0] B,
    input [3:0] Opcode,
    output reg [7:0] Y,
    output reg carry, 
    output reg Zero_flag,
    output reg Overflow_flag
);
    always @(*) begin
        carry = 1'b0;
        Zero_flag = 1'b0;
        Overflow_flag = 1'b0;
        Y = 8'b0;
        case(Opcode)
            4'b0000 : {carry, Y} = A + B ;
            4'b0001 : {carry, Y} = A - B ;
            4'b0010 : Y = A & B ;
            4'b0011 : Y = A | B ;
            4'b0100 : Y = A ^ B ;
            4'b0101 : Y = ~A ;
            4'b0110 : {carry, Y} = A + 1 ; //inr
            4'b0111 : {carry, Y} = A - 1 ;
            4'b1000 : begin Y = A << 1; carry = A[7]; end  // left shift, MSB → carry
            4'b1001 : begin Y = A >> 1; carry = A[0]; end  // right shift, LSB → 
            default : begin Y = 8'b0; carry = 0; end
        endcase
        Zero_flag = (Y == 0) ? 1'b1 : 1'b0;
    end
endmodule