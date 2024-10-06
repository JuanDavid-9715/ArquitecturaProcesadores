`include "top.v"
`timescale 1ns/1ns

module top_tb();
    reg [3:0] A_tb;
    reg [3:0] B_tb;
    reg Clk_tb;
    reg Init_tb;    
    reg [1:0] Select_tb;
    
    wire Cout_tb;
    wire Done_tb;
    wire [6:0] oup_display1_tb;
    wire [6:0] oup_display2_tb;
    wire [6:0] oup_display3_tb;
    wire [6:0] oup_display4_tb;
    wire [6:0] oup_display5_tb;
    wire [6:0] oup_display6_tb;

    // Instantiate the Unit Under Test (UUT)
    top uut (
        .A(A_tb), 
        .B(B_tb), 
        .Clk(Clk_tb),
        .Init(Init_tb),
        .Select(Select_tb),
        .Cout(Cout_tb), 
        .Done(Done_tb),
        .oup_display1(oup_display1_tb),
        .oup_display2(oup_display2_tb),
        .oup_display3(oup_display3_tb),
        .oup_display4(oup_display4_tb),
        .oup_display5(oup_display5_tb),
        .oup_display6(oup_display6_tb)
    );

    always #1 Clk_tb = ~Clk_tb;

    initial begin
        Clk_tb = 1'b0;
        A_tb=0;
        B_tb=0;
        Init_tb = 1;

        Select_tb = 2'b00;
        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #5;
            end
        end

        #5 $display("Suma finalizada");

        Select_tb = 2'b01;
        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #5;
            end
        end

        #5 $display("Resta finalizada");

        Select_tb = 2'b10;
        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #2 Init_tb = 0;
                #2 Init_tb = 1;
                #30;

                #5;
            end
        end

        #5 $display("Multiplicacion finalizada");

        Select_tb = 2'b11;
        for(A_tb = 0; A_tb < 15; A_tb = A_tb + 1) begin
            for(B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #5;
            end
        end

        #5 $display("And finalizada");

        $finish;
    end      

    initial begin: TEST_CASE
        $dumpfile("top_tb.vcd");
        $dumpvars(-1, uut);
    end
endmodule