module Decoder_ALU( clk,address, suma,complemento, shift_R, shift_l,compC,compn,load,save
    
);
input clk;
input [2:0] address;
output reg [1:0] suma;
output reg [1:0] complemento;
output reg [1:0] shift_R;
output reg [1:0] shift_l;
output reg [1:0] compC;
output reg [1:0] compn;
output reg [1:0]load;
output reg [1:0]save;
always @ (posedge clk) begin
    case (address)
        3'h0 : suma = 1'b1;
        3'h1 : complemento= 1'b1;
        3'h2 : shift_R = 1'b1;
        3'h3 : shift_l= 1'b1;
        3'h4 : compC = 1'b1;
        3'h5 : compn = 1'b1;
        3'h6 : save= 1'b1;
        3'h7 : load = 1'b1;
        default: 
    endcase
end
always @(negedge clk) begin
    suma <= 1'b0;
    complemento= 1'b0;
    shift_R = 1'b0;
    shift_l= 1'b0;
    compC = 1'b0;
    compn = 1'b0;
    save= 1'b0;
    load = 1'b0;

    
end
endmodule // Decoder_ALU