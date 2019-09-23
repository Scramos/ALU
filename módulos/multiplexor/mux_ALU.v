module mux_ALU(opcode,sol_suma, sol_complemento,sol_shift_R,sol_shift_l,sol_load,sol_compc,sol_compn,final_result
    );
    input [3:0] sol_suma;
    input [3:0] sol_shift_R;
    input [3:0] sol_shift_l;
    input [3:0] sol_complemento;
    input [3:0] sol_load;
    input [3:0] sol_compc;
    input [3:0] sol_compn;
    output reg  [3:0] final_result;
    input  [2:0] opcode;
    output ;

    always @(*) begin

    case (opcode)
        3'h0 : (final_result <= sol_suma);
        3'h1 : final_result <= sol_complemento;
        3'h2 : final_result <= sol_shift_R;
        3'h3 : final_result <= sol_shift_l;
        3'h4 : final_result <= sol_compc;
        3'h5 : final_result <= sol_compn;
        // 3'h6 : final_result <=  3'b001;
        3'h7 : final_result <= sol_load; 
        default: 
    endcase
        
    end


endmodule // mux_ALU