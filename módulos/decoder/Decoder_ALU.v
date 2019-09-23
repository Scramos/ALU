module decoder_ALU( clk, address, general_output);

input clk;
input [2:0] address;
output reg [0:7] general_output;

always @ (posedge clk) begin
    case (address)
        3'h0 : general_output <= 8'b00000000;
        3'h1 : general_output <= 8'b00000001;
        3'h2 : general_output <= 8'b00000010;
        3'h3 : general_output <= 8'b00000100;
        3'h4 : general_output <= 8'b00001000;
        3'h5 : general_output <= 8'b00010000;
        3'h6 : general_output <= 8'b00100000;
        3'h7 : general_output <= 8'b01000000;
    endcase
end

endmodule // Decoder_ALU