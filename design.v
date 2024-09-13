// Fadli Shidqi Firdaus
// 21120122140166

module half_adder_tb;
module demux_1to4 (
    input A,         // Single input
    input [1:0] S,   // 2-bit selector
    output [3:0] Y_gate,   // Output for gate level
    output [3:0] Y_data,   // Output for data flow
    output reg [3:0] Y_beh // Output for behavioral );

    // Gate Level Description
    assign Y_gate[0] = ~S[1] & ~S[0] & A;
    assign Y_gate[1] = ~S[1] & S[0] & A;
    assign Y_gate[2] = S[1] & ~S[0] & A;
    assign Y_gate[3] = S[1] & S[0] & A;

    // Data Flow Description
    assign Y_data = (S == 2'b00) ? 4'b0001 :
                    (S == 2'b01) ? 4'b0010 :
                    (S == 2'b10) ? 4'b0100 :
                    (S == 2'b11) ? 4'b1000 : 4'b0000;

    // Behavioral Description
    always @(*) begin
        case (S)
            2'b00: Y_beh = 4'b0001;
            2'b01: Y_beh = 4'b0010;
            2'b10: Y_beh = 4'b0100;
            2'b11: Y_beh = 4'b1000;
            default: Y_beh = 4'b0000;
        endcase
    end
endmodule
