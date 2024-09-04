`include "sumador_4bit.v"
`timescale 1ns/1ns

module sumador_4bit_tb();
    reg [3:0] A_tb;
    reg [3:0] B_tb;

    wire Cout_tb;
    wire [3:0] Sum_tb;

    // Instantiate the Unit Under Test (UUT)
    sumador_4bit uut (
        .A(A_tb), 
        .B(B_tb), 
        .Cout(Cout_tb), 
        .Sum(Sum_tb)
    );

    initial begin
        A_tb=0;

        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #5 $display("el valor de %d + %d = %d", A_tb, B_tb, Sum_tb);
            end
        end
        $finish;
    end      

    initial begin: TEST_CASE
        $dumpfile("sumador_4bit_tb.vcd");
        $dumpvars(-1, uut);
    end
endmodule