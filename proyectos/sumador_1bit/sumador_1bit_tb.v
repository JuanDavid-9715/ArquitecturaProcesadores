`timescale 1ns/1ns
`include "sumador_1bit.v"

module sumador_1bit_tb();
    reg A_tb;
    reg B_tb;
    reg Ci_tb;

    sumador uut(
        .A(A_tb),
        .B(B_tb),
        .Ci(Ci_tb)
    );

    initial begin
        A_tb=0;
        B_tb=1;
        Ci_tb=1;
    end

    initial begin: TEST_CASE
        $dumpfile("sumador_1bit_tb.vcd");
        $dumpvars(-1, uut);
        #200 $finish;
    end
endmodule