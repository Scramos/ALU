module complemento #(
    parameter inputsize = 4
) data, enable, result,done_complemento);

input [inputsize-1:0] data
input enable;
output reg [inputsize-1:0] result;
output  reg  done_complemento ;
reg [3:0] A;

always @ (posedge enable) begin
A <= data[7:4];
    if (enable) begin
        result <= ~A;
    end
done_complemento <= 1'b1;
end
always @(negedge enable) begin
done_complemento <= 1'b0;
    
end


endmodule