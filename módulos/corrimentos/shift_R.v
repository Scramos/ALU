module shift_R #(
    parameter inputsize = 8
)(data, enable, result, done_shiftR);

input [inputsize-1:0] data;
input enable; 
output reg [3:0] result;
output reg done_shiftR;
reg  [3:0]A ;

always @ (posedge enable) begin
    A <= data[7:4];
    result <= {1'b0, A[3:1]};
    done_shiftR <= 1'b1;
end
always @(negedge enable ) begin
    done_shiftR <= 1'b0;    
end

endmodule