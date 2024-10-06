module top (
    input [3:0] A,
    input [3:0] B,
    input Clk,
    input Init,    
    input [1:0] Select,
    output Cout,
    output Done,
    output [6:0] oup_display1,
    output [6:0] oup_display2,
    output [6:0] oup_display3,
    output [6:0] oup_display4,
    output [6:0] oup_display5,
    output [6:0] oup_display6
);

    wire [7:0] alu_oup;
    reg [3:0] operador;

    initial begin
        operador = 4'b0100;
    end

    alu alu1(.A(A), .B(B), .Clk(Clk), .Init(~Init), .Select(Select), .Cout(Cout), .Done(Done), .Sal(alu_oup));

    always @(negedge Clk) begin
        if (Select != 2'b01) begin
            operador = 4'b0100;
        end
        else begin
            if (alu_oup != 0) begin
                operador = (Cout) ? 4'b0001 : 4'b0100;
            end
            else begin
                operador = 4'b0100;
            end
        end
    end

    display_num display1(.num(A), .seg(oup_display1));
    display_ope display2(.ope({2'b00, Select}), .seg(oup_display2));
    display_num display3(.num(B), .seg(oup_display3));
    display_ope display4(.ope(operador), .seg(oup_display4));
    display_num display5(.num(alu_oup[7:4]), .seg(oup_display5));
    display_num display6(.num(alu_oup[3:0]), .seg(oup_display6));
    
endmodule