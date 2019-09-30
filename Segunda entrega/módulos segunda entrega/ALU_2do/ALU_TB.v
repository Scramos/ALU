
module ALU_TB ();

reg sys_clk_i, sys_rst_i;
reg [7:0]instrucciones;
reg active;


ALU uut(.clk(sys_clk_i),.reset(sys_rst_i),.active(active),.instrucciones(instrucciones));


initial begin
sys_clk_i = 0;
sys_rst_i = 0;
init =0;
#10

sys_rst_i = 1;
#100

sys_rst_i = 0;
init = 1;
#200

init = 0;

end

always sys_clk_i = #1 ~sys_clk_i;


initial begin: TEST_CASE
  $dumpfile("ALU_TB.vcd");
  $dumpvars(-1, uut);
  #1000000 $finish;
end

endmodule
