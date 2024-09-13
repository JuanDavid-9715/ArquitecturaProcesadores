`include "sumador_4bit.v"

module restador_4bit(
    input [3:0] A,
    input [3:0] B,
    input       select,
    output Cout,
    output   [3:0] S
);

    wire [3:0] Bx;
    wire [3:0] s1;

    xor(Bx[0], B[0], select);
    xor(Bx[1], B[1], select);
    xor(Bx[2], B[2], select);
    xor(Bx[3], B[3], select);

    sumador_4bit s0(.A(A), .B(Bx), .Ci(select), .Cout(Cout), .Sum(s1));

    assign S = (Cout) ? s1 : ~s1 | 1;
endmodule