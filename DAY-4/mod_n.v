module mod_n_counter(
    input clk, rst_n, 
    input [3:0]N,
    output reg [3:0] count
);
    integer i;
    always @(posedge clk) begin
        if (!rst_n) begin
            count <= 'd0;
        end else begin
            for (i=0; i<=N ; i=i+1) begin
                count <= count + 1;
            end
        end
    end
endmodule

// module mod_n_counter(
//     input clk, rst_n, 
//     input [3:0] N,
//     output reg [3:0] count
// );
//     always @(posedge clk) begin
//         if (!rst_n) begin
//             count <= 'd0;
//         end else begin
//             count <= count + 1;
//             if (count == N-1) begin
//                 count <= 'd0;
//             end
//         end
//     end
// endmodule