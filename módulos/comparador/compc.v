module compc #(
    parameter inputsize = 4
)( data_in, enable, ab_out,done_compc);

input enable;
input [7:0] data_in;
reg [inputsize - 1:0] A;
reg [inputsize - 1:0] B;
output reg [3:0]ab_out;
output reg done_compc;

always @ (posedge enable ) begin
 A <= data_in[7:4];
 B <= data_in[3:0];
        if (A == B) begin
        ab_out <= 1;
        end else begin
        ab_out <= 0;
        end
done_compc <= 1'b1;
end
always @(negedge enable) begin
done_compc <= 1'b0;    
end

endmodule