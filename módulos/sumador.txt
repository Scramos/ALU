module Sumador(

input [3:0]a,b,
output wire [3:0]suma,
output wire cout
);

parameter N=4,
	N1=N-1;
wire [N:0] sum;

assign sum= {1'b0,a}+{1'b0,b};
assign suma=sum [N1:0];
assign cout=sum [N];


endmodule
