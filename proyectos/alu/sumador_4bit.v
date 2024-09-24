module sumador_4bit(
        input  [3:0] A,
        input  [3:0] B,
        input        Ci,
        output       Cout,
        output [3:0] Sum
    );

    wire c1, c2, c3;
    
    sumador_1bit s0 (.A(A[0]), .B(B[0]), .Ci(Ci), .Cout(c1), .Sum(Sum[0]));
    sumador_1bit s1 (.A(A[1]), .B(B[1]), .Ci(c1), .Cout(c2), .Sum(Sum[1]));
    sumador_1bit s2 (.A(A[2]), .B(B[2]), .Ci(c2), .Cout(c3), .Sum(Sum[2]));
    sumador_1bit s3 (.A(A[3]), .B(B[3]), .Ci(c3), .Cout(Cout), .Sum(Sum[3]));
endmodule