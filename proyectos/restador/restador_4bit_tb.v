`include "restador_4bit.v"
`timescale 1ns/1ns

module restador_4bit_tb();
    reg [3:0] A_tb;
    reg [3:0] B_tb;
    reg select_tb;

    wire Cout_tb;
    wire [3:0] S_tb;

    // Instantiate the Unit Under Test (UUT)
    restador_4bit uut (
        .A(A_tb), 
        .B(B_tb), 
        .select(select_tb),
        .Cout(Cout_tb), 
        .S(S_tb)

    );

    initial begin
        A_tb=0;
        B_tb=0;
        select_tb=0;

        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #5 $display("Con el valor de select 0, el valor de %d - %d = %d", A_tb, B_tb, S_tb);
            end
        end
        select_tb=1;
        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #5 $display("Con el valor de select 1, el valor de %d - %d = %d", A_tb, B_tb, S_tb);
            end
        end
        $finish;
    end      

    initial begin: TEST_CASE
        $dumpfile("restador_4bit_tb.vcd");
        $dumpvars(-1, uut);
    end
endmodule