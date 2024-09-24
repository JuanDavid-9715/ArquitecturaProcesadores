`include "sumador_1bit.v"
`include "sumador_4bit.v"
`include "restador_4bit.v"
`include "multiplicador.v"

module alu (
    input [3:0] A,
    input [3:0] B,
    input Clk,
    input Init,    
    input [1:0] Select,
    output Cout,
    output Done,
    output reg [7:0] Sal
);

    wire [3:0] sal_sum, sal_res;
    wire [7:0] sal_mul;

    sumador_4bit sum(.A(A), .B(B), .Ci(1'b0), .Cout(Cout), .Sum(sal_sum));
    restador_4bit res(.A(A), .B(B), .Select(1'b0), .Cout(Cout), .Res(sal_res));
    multiplicador mul(.clk(Clk), .init(Init), .MR(A), .MD(B), .done(Done), .pp(sal_mul));

    always @(*) begin
        case(Select)
            2'b00: Sal = {4'b0000, sal_sum};
            2'b01: Sal = 8'b00000000; 
            2'b10: Sal = 8'b00000000; 
            2'b11: Sal = 8'b00000000; 
            default: Sal = 8'b00000000;
        endcase
    end

endmodule //alu