module suma #( inputzise = 8)(active , data_in, result_suma, done_suma 
);
input [inputzise-1:0] data_in;
input active;
output reg  [3:0] result_suma;
output reg done_suma;
reg [3:0] A;
reg [3:0] B;
always @(active) begin
	A <= data_in[7:4];
	B <= data_in[3:0];
	result_suma <= A + B ;
	done_suma <= 1'b1;
end
always @(negedge enable ) begin
    done_suma <= 1'b0;    
end
	
endmodule
