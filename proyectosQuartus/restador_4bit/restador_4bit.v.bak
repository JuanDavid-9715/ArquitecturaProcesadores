module restador_4bit(
    input [3:0] A,
    input [3:0] B,
    input       Select,
    output      Cout,
    output   [3:0] Res
);

    wire [3:0] Bx;
    wire [3:0] s;

    xor(Bx[0], B[0], Select);
    xor(Bx[1], B[1], Select);
    xor(Bx[2], B[2], Select);
    xor(Bx[3], B[3], Select);

    sumador_4bit s0(.A(A), .B(Bx), .Ci(Select), .Cout(Cout), .Sum(s));

    assign Res = (Cout) ? s : ~s + 1'b1;
endmodule