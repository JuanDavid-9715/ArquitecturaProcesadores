`include "alu.v"
`timescale 1ns/1ns

module alu_tb();
    reg [3:0] A_tb;
    reg [3:0] B_tb;
    reg Clk_tb;
    reg Init_tb;    
    reg [1:0] Select_tb;
    wire Cout_tb;
    wire Done_tb;
    wire [7:0] Sal_tb;

    // Instantiate the Unit Under Test (UUT)
    alu uut (
        .A(A_tb), 
        .B(B_tb), 
        .Clk(Clk_tb),
        .Init(Init_tb),
        .Select(Select_tb),
        .Cout(Cout_tb), 
        .Done(Done_tb),
        .Sal(Sal_tb)
    );

    always #1 Clk_tb = ~Clk_tb;

    initial begin
        Clk_tb = 1'b0;
        A_tb=0;
        B_tb=0;
        Init_tb = 0;

        Select_tb = 2'b00;
        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #5 $display("el valor de %d + %d = %d", A_tb, B_tb, Sal_tb);
            end
        end

        Select_tb = 2'b01;
        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #5 $display("el valor de %d - %d = %d", A_tb, B_tb, Sal_tb);
            end
        end

        Select_tb = 2'b10;
        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #2 Init_tb = 1;
                #2 Init_tb = 0;
                #30

                #5 $display("el valor de %d * %d = %d", A_tb, B_tb, Sal_tb);
            end
        end

        $finish;
    end      

    initial begin: TEST_CASE
        $dumpfile("alu_tb.vcd");
        $dumpvars(-1, uut);
    end
endmodule