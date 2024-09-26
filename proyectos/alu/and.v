module and0(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sal
);

    assign Sal = A & B;

endmodule //and