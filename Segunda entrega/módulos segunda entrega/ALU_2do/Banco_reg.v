module Banco_reg #(parameter Tamdata = 4, Tamrow = 2)
(clk,reset, instr, data_result, data_A , data_B,rd , done, init);
input clk;
input reset;
input [7:0] instr;
input [3:0] data_result;
input rd;
input init;
reg [Tamdata-1:0] memory [Tamrow-1:0] ;
output reg [3:0] data_A;
output reg [3:0] data_B;
output reg done ;


reg posicion ;
reg pos_A;
reg pos_B;
initial begin
    memory [0] = 4'b0000;
    memory [1] = 4'b0000;
end

always @(posedge clk) begin
if (init == 1) begin
      case (instr[7:5])      // decodificacion de la instruccion y envia el dato
        3'h0 : begin
            posicion <= instr[4];
            pos_A <= instr[3];
            pos_B <= instr[2];  
        end
        3'h1 : begin
            posicion <= instr[4];
            pos_A <= instr[3];  
        end
        3'h2: begin
            posicion <= instr[4];
            pos_A <= instr[3]; 
        end
        3'h3 : begin
            posicion <= instr[4];
            pos_A <= instr[3];       
        end
        3'h4 : begin
            posicion <= instr[4];
            pos_A <= instr[3];   
            pos_B <= instr[2];     
        end
        3'h5 : begin
            posicion <= instr[4];
            pos_A <= instr[3];
            pos_B <= instr[2];  
        end
        3'h6 : begin
            posicion <= instr[4];            
        end
        3'h7 : begin
            posicion <= instr[4];
            pos_A <= instr[3];  
        end

    endcase  
     data_A <= memory[pos_A];
    data_B <= memory[pos_B];
end
end

always @(posedge clk ) begin
done <= 1'b0;
if (reset == 1) begin
     memory[0] <= 4'b0000;
     memory[1] <= 4'b0000;
end 
if (rd == 1) begin
   memory[posicion] <= data_result;
   done <= 1'b1;

end // Escribe resultado    
end



endmodule // Banco_reginstr, 