module display_ope(
    input [3:0] ope,
    output reg [6:0] seg
);
    always @(ope) begin
        case (ope)
            0:seg = 7'b1011100;
            1:seg = 7'b1111110;
            2:seg = 7'b1001000;
            3:seg = 7'b0001000;
            4:seg = 7'b1110110;
            default:seg = 7'b1111111;
        endcase
    end
endmodule