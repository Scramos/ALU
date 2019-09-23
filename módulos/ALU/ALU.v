module ALU(datos,opcode,registro,posicion,clk    
);
input clk;
input [7:0] datos;
input [2:0] opcode;
input [2:0] registro;
input posicion ;
wire suma,complemento,shiftl,shiftR,compn,compc,load,save;
wire  [3:0]result_suma,result_complemento,result,result_shiftl,result_shiftR,result_compc,result_compn,result_mux,result_load;

Decoder_ALU deco(.clk(clk), .address(opcode), .suma(suma),.complemento(complemento),
.shift_R(shiftR), .shift_l(shift_l), .compc(compc), .compn(compn),.load(load), .save(save));
suma suma(.active(suma), .data_in(), .result_suma(result_suma) , .done_suma());
complemento ccmplemento(.enable(complemento),.data(),.result(result_complemento),.done_complemento());
shift_l shifleft( .enable(shift_l),.data(), .result(result_shiftl),.done_shiftl());
shift_R shiftRigth(.enable(shiftR),.data(),.result(result_shiftR), .done_shiftR());
compc igual(.enable(compc),.data_in(),.ab_out(result_compc),done_compc());
compn mayor (.enable(),.data_in(),.ab_out(result_compn),.done_compn());
load load(.enable(load),.datos(),.data_out(result_load),.done_load());
save save(.active(save), .pos_save(posicion),.data_result(result_mux),.data_AB(datos),.data_outA(),.data_outB()
,.done());
mux_ALU mux(.opcode(opcode),.sol_suma(result_suma),.sol_complemento(result_complemento),.sol_shiftl(result_shiftl),.sol_shiftR(result_shiftR),.sol_load(result_load),
.sol_compc(result_compc),.sol_compn(result_compn),.final_result(result_mux));
Register_ALU memory();
alu_controler Control();

    

endmodule // ALUdatos,opcode,registro,posicio,clk
