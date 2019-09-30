module ALU #( parameter  nbits = 4 , parameter Taminstr =  8,  parameter fin = 100, fout = 50 )
( leds,instrucciones , clk ,  reset , active );
input clk ;
input reset ;
input active ;
input [Taminstr-1 :0] instrucciones;
output [nbits-1 :0 ] leds;
wire [nbits-1 :0 ] datoA ;
wire [nbits-1 :0 ] datoB ;
 wire [nbits-1 : 0] resultado;
 wire doneOp;
 wire doneBr;
 wire rd; 
 wire init_other; 
 reg clko = 1;

    reg [fout-1:0] count = 0;
 
 always @ (posedge clk) begin
    
            count = count + 1;
            if (count == fin/fout) begin
                clko = ~clko;
                count = 0;
            end
    end

Operaciones operaciones(.clk(clko),.instr(instrucciones), .A(datoA), .B(datoB), 
.dato_mux(resultado) ,.data_outlo(leds), .rd(rd),.init(init_other),.done(doneOp));
Banco_reg registros ( .clk(clk), .reset(reset), .instr(instrucciones), .data_result(resultado),
 .data_A(datoA),.data_B(datoB), .rd(rd) , .init(init_other),.done(doneBr));
 Controlador control(.read_Instr(active), .init_Memory(init_other), .doneCalcule(doneOp), 
 .initrd(rd),.doneresult(doneBr));


endmodule  // ALU 