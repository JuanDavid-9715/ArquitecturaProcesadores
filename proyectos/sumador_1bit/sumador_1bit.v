module sumador(
    input A,
    input B,
    input Ci,
    output cout,
    output S
);

wire a_ab;
wire x_ab;
wire count_t;

and(a_ab, A, B);
xor(x_ab, A, B);

xor(S, x_ab, Ci);
and(count_t, x_ab, Ci);

or(cout, count_t, a_ab);

endmodule