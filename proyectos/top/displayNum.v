module displayNum(
    input [3:0] num,
    output reg [6:0] seg
);
    always @(num) begin
        case (num)
            0:seg = 7'b0000001;
            1:seg = 7'b1001111;
            2:seg = 7'b0010010;
            3:seg = 7'b0000110;
            4:seg = 7'b1001100;
            5:seg = 7'b0100100;
            6:seg = 7'b0100000;
            7:seg = 7'b0001111;
            8:seg = 7'b0000000;
            9:seg = 7'b0000100;
            10:seg = 7'b0001000;
            11:seg = 7'b0000011;
            12:seg = 7'b1000110;
            13:seg = 7'b0100001;
            14:seg = 7'b0000110;
            15:seg = 7'b0001110;
            default:seg = 7'b1111111;
        endcase
    end
endmodule
