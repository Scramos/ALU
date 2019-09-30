module Banco_reg #(parameter Tamdata = 4, Tamrow = 2)
(clk,reset, instr, data_result, data_A , data_B,rd);
input clk;
input reset;
input [7:0] instr;
input [3:0] data_result;
input rd;
reg [Tamdata-1:0] memory [Tamrow-1:0] = {0000, 0000};
output reg [3:0] data_A;
output reg [3:0] data_B;

reg posicion ;
reg pos_A;
reg pos_B;

always @(posedge clk) begin  // decodificacion de la instruccion y envia el dato
    case (instr[7:5])
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
/*always @(posedge clk ) begin // Envio en memoria 
    memory[posicion] <= data_result;
end
*/
always @(posedge clk ) begin
if (reset == 1) begin
     memory[0] <= 4'b0000;
     memory[1] <= 4'b0000;
end 
if (rd == 1) begin
   memory[posicion] <= data_result; 
end // Escribe resultado    
end



endmodule // Banco_reginstr, 