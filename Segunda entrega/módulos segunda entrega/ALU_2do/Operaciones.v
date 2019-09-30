module Operaciones(instr,A,B,clk,dato_mux, data_outlo,rd, init,done) , 

input clk;
input [7:0] instr;
input [3:0] A;
input [3:0] B;
input rd;
input init;
reg [3:0] dato1;
reg [3:0] dato2;
reg [3:0] dato_outsum;
reg [3:0] dato_outcomp;
reg [3:0] dato_outsl;
reg [3:0] dato_outsr;
reg [3:0] dato_outcmi;
reg [3:0] dato_outcmm;
reg [3:0] dato_outsa;
output [3:0] data_outlo;
output reg [3:0] dato_mux;
output reg done ;

always @(posedge clk) begin
if (init == 1) begin
	case (instr [7:5])
	3'h0 : begin // suma
		dato1 <= A; // Guarda el dato en el registro A
 		dato2 <= B; // Guarda el dato en el registro B
		dato_outsum <= dato1+dato2; // Realiza la suma de A y B y lo guarda en dato_outsum
		end 
	3'h1:  begin //complemento
		dato1 <= A; // Guarda el dato en el registro A
		dato_outcomp <= dato1; //Hace el complemento y lo guarda en dato_outcomp
		end
	3'h2 : begin //
		dato1 <= A; // Guarda el dato en el registro A
		dato_outsl <= {dato1[2:0], 1'b0}; // Toma desde el bit más significativo tres datos y luego lo concatena con un cero en la posición menos significativa y lo guarda.
		end
	3'h3 :  begin
		dato1 <= A; // Guarda el dato en el registro A
		dato_outsr <= {1'b0, dato1[3:1]}; // Toma desde el bit menos significativo tres datos y los concatena con un cero en el posición más significativa. 
		end
	3'h4 :  begin
		dato1 <= A; // Guarda el dato en el registro A
 		dato2 <= B; // Guarda el dato en el registro B
        	if (dato1 == dato2) begin
			  dato_outcmi <= 1; //Envía un 1 dado que la comparación es cierta
			end //Realiza la comparación de igualdad entre A y B 
			else begin
			 dato_outcmi <= 0; //Envía un cero cuando la comparación es falsa 
			end
        	end 

	3'h5 :  begin
	  	dato1 <= A; // Guarda el dato en el registro A
		dato2 <= B; // Guarda el dato en el registro B
		if (dato1 > dato2) begin
		  dato_outcmm <= 1; // Envía uno si A es mayor a B
		end// Realiza la comparación de mayoría entre A y B
		 else begin
		   dato_outcmm <= 0;// Envía cero en caso contrario
		 end
	end
	
	3'h6 :  begin
		dato_outsa <=  instr[3:0]; // Guarda tomado direcatamente de la instruccion
		
		end

	3'h7 :  begin 
		dato_outlo <= A; // Guarda el dato en el registro A

		end
	endcase
	done <= 1'b1;
end
end
always @(posedge clk) begin
if (rd == 1) begin
		case (instr[7:5]) 
		3'h0 :  begin dato_mux <= dato_outsum; ;  end
		3'h1 :  begin dato_mux <= dato_outcomp; end
		3'h2 :  begin dato_mux <= dato_outsl;  end
		3'h3 :  begin dato_mux <= dato_outsr;   end
		3'h4 :  begin dato_mux <= dato_outcmi; end
		3'h5 :  begin dato_mux <= dato_outcmm; end
		3'h6 :  begin data_mux <= dato_outsa;   end
		// 3'h7 :  rd <= 1'b0 ;
		endcase
		done <= 1'b0;
	end

end
endmodule  // Operaciones #()