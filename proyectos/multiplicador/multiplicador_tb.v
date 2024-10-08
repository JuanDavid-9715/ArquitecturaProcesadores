`timescale 1ns / 1ps
`include "multiplicador.v"

module mult_tb(); 

    reg clk;
    reg init;
    reg [3:0] MR;
    reg [3:0] MD;

    wire [7:0] pp;
    wire done;

    // Instantiate the Unit Under Test (UUT)
    multiplicador uut (
        .clk(clk), 
        .MR(MR), 
        .MD(MD), 
        .init(init), 
        .pp(pp), 
        .done(done)
    );

    always #1 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        MR = 3'b0;
        MD = 3'b0;
        #10 init = 1;
        for(MR = 0; MR < 15; MR = MR + 1) begin
            for(MD = 0; MD < 15; MD = MD + 1) begin
                #2 init = 1;
                #2 init = 0;
                #30 
                #5 $display("%d * %d = %d", MD, MR, pp);
            end
        end
        init = 0;
        $finish;
    end

    initial begin: TEST_CASE
        $dumpfile("mult_tb.vcd");
        $dumpvars(-1, uut);
    end
endmodule
