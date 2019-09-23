module alu_controler(done_suma,done_compc,done_compn,done_complemento,done_load,done_shiftl,
done_shiftR,done,data_in,rd,wr,opcode,data_suma,data_complemento,data_compn,data_compc,data_shiftl,
data_shiftR,data_load
);
input done_compc,done_complemento,done_compn,done_load,done_shiftR,done_shiftl,done_suma;
input [7:0] data_in;
input opcode;
output wr,rd;
output reg done;
output reg [7:0] data_compc;
output reg [7:0] data_complemento ;
output reg [7:0] data_compn;
output reg [7:0] data_load;
output reg [7:0] data_shiftR;
output reg [7:0] data_shiftl;
output reg [7:0] data_suma;

always @(*) begin
        if ((done_compc)||(done_complemento)||(done_compn)||(done_load)||(done_shiftR)||
        (done_shiftl)||(done_suma)) 
            begin
              done <= 1'b1;
              wr <= 1'b1;
              rd <= 1'b0;
            end 
        else begin
              done <= 1'b0;
        end
case (opcode)
        3'h0 : begin  wr<=1'b0; rd<=1'b1; data_suma<=data_in;   end
        3'h1 :  begin  wr<=1'b0; rd<=1'b1; data_complemento<=data_in;   end
        3'h2 :  begin  wr<=1'b0; rd<=1'b1; data_shiftl<=data_in;   end
        3'h3 : begin  wr<=1'b0; rd<=1'b1; data_shiftR<=data_in;   end
        3'h4 :  begin  wr<=1'b0; rd<=1'b1; data_compc<=data_in;   end
        3'h5 :  begin  wr<=1'b0; rd<=1'b1; data_compn<=data_in;   end
        //3'h6 :  begin  wr<=1'b0; rd<=1'b1; data_suma<=data_in;   end
        3'h7 :  begin  wr<=1'b0; rd<=1'b1; data_load<=data_in;   end
        default: 
    endcase   
end



endmodule // alu_control