module alu (
    input [3:0] A,
    input [3:0] B,
    input Clk,
    input Init,    
    input [1:0] Select,
    output reg Cout,
    output reg Done,
    output reg [7:0] Sal
);

    wire [3:0] sal_sum, sal_res, sal_and;
    wire [7:0] sal_mul;
    wire cout_sum, cout_res, done_mul;

    sumador_4bit sum(.A(A), .B(B), .Ci(1'b0), .Cout(cout_sum), .Sum(sal_sum));
    restador_4bit res(.A(A), .B(B), .Select(1'b1), .Cout(cout_res), .Res(sal_res));
    multiplicador mul(.clk(Clk), .init(Init), .MR(A), .MD(B), .done(done_mul), .pp(sal_mul));
    and0 and1(.A(A), .B(B), .Sal(sal_and));

    always @(*) begin
        case(Select)
            2'b00: begin
                Sal = {4'b0000, sal_sum};
                Cout = cout_sum;
                Done = 1'b0;
            end
            2'b01: begin
                Sal = {4'b0000, sal_res}; 
                Cout = cout_res;
                Done = 1'b0;
            end
            2'b10: begin
                Sal = sal_mul; 
                Cout = 1'b0;
                Done = done_mul;
            end
            2'b11: begin
                Sal = sal_and;
                Cout = 1'b0;
                Done = 1'b0;
            end
            default: begin
                Sal = 8'b00000000;
            end
        endcase
    end

endmodule //alu