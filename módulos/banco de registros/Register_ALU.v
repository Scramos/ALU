module Register_ALU#(parameter Tamdata = 4, Tamrow = 2)(
    data_inA,data_inB, instr,data_out,rd,wr
);
input [3:0] data_inA ;
input [3:0] data_inB;
input rd,wr;
reg [Tamdata-1:0] memory [Tamrow-1:0] 
input [2:0] instr ;
output [7:0] data_out;
always @(*) begin
    if (rd) begin
        case (instr)
            2'b00:begin data_out[7:4]=data_inB; data_out[3:0]=data_inB;  end 
            2'b01:begin data_out[7:4]=data_inB; data_out[3:0]=data_inA; end
            2'b10:begin data_out[7:4]=data_inA; data_out[3:0]=data_inB;  end 
            2'b11:begin data_out[7:4]=data_inA; data_out[3:0]=data_inA;  end
            default: 
        endcase
        
    end
    if (wr) begin
    memory[2:1] <= data_inA;
    memory[1:0] <= data_inB;       
    end
    
end


    




endmodule // Register_ALU# (parameter nBits = 32, inouts = 5, tamPro = 16, tamAddr = 4)da