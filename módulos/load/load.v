module load #(
    parameter input_size = 8
    )(datos, dato_out, enable, done_load);

input enable;
input [input_size-1:0]datos;
output [3:0] dato_out;
output done_load;

always @(enable) begin
 dato_out<= datos[7:4];
 done_load <= 1'b1;
end
always @(negedge enable ) begin
    done_load <= 1'b0;    
end




endmodule