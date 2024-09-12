`include "sumador_4bit.v"

module restador_4bit(
    input [3:0] A,
    input [3:0] B,
    input       select,
    output [3:0] S,
    output       Cout
);

wire [3:0] x;

xor(B[0], select, x[0]);
xor(B[1], select, x[1]);
xor(B[2], select, x[2]);
xor(B[3], select, x[3]);

sumador_4bit (.A(A), .B(x), Cout(Cout), .Sum(S));

endmodule