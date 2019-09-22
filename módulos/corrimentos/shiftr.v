module shift(clock, si, so);

input clock, si;
output so;

reg 3:0] valor=4'b1010
always @ posedge clk)
	valor<={valor[2:0];si}
assing so=valor[4];
endmodule 
