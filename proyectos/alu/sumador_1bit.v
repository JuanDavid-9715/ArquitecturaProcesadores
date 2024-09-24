module sumador_1bit(
        input A,
        input B,
        input Ci,
        output Cout,
        output Sum
    );

    wire a_ab;
    wire x_ab;
    wire count_t;

    and(a_ab, A, B);
    xor(x_ab, A, B);

    xor(Sum, x_ab, Ci);
    and(count_t, x_ab, Ci);

    or(Cout, count_t, a_ab);
endmodule