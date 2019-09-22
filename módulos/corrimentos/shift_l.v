module l_shift #(
    parameter inputsize = 8
)(data, enable, result, done_shiftl);


input [inputsize-1:0] data;
input enable; 
output reg [3:0] result;
output reg done_shiftl;
reg  [3:0]A ;

always @ (posedge enable) begin
    A <= data[7:4];
    result <= {A[2:0],1'b0};
    done_shiftl <= 1'b1;
end
always @(negedge enable ) begin
    done_shiftl <= 1'b0;    
end

endmodule