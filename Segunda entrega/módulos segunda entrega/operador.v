module operador(instr,A,B,clk,dato_mux, data_outlo);

input clk;
input [7:0] instr;
input [3:0] A;
input [3:0] B;
	
output [3:0] dato_outlo;
output reg [3:0] dato_mux;
	
reg [3:0] dato1;
reg [3:0] dato2;
reg [3:0] dato_outsum;
reg [3:0] dato_outcomp;
reg [3:0] dato_outsl;
reg [3:0] dato_outsr;
reg [3:0] dato_outcmi;
reg [3:0] dato_outcmm;
reg [3:0] dato_outsa;

always @(posedge clk) begin

	case (instr [7:5])
	3'h0 : begin
		dato1 <= A; // Guarda el dato en el registro A
 		dato2 <= B; // Guarda el dato en el registro B
		dato_outsum <= dato1+dato2; // Realiza la suma de A y B y lo guarda en dato_outsum
		end 
	3'h1:  begin
		dato1 <= A; // Guarda el dato en el registro A
		dato_outcomp <= dato1; //Hace el complemento y lo guarda en dato_outcomp
		end
	3'h2 : begin
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
		dato_outsa <= A; // Guarda el dato en el registro A
		
		end

	3'h7 :  begin 
		dato_outlo <= A; // Guarda el dato en el registro A

		end
	endcase



end
always @(posedge clk) begin

	case (instr[7:5]) 
	3'h0: dato_mux <= dato_outsum; 
	3'h1: dato_mux <= dato_outcomp;
	3'h2: dato_mux <= dato_outsl;
	3'h3: dato_mux <= dato_outsr;
	3'h4: dato_mux <= dato_outcmi;
	3'h5: dato_mux <= dato_outcmm;
	//3'h6: data_mux <= data_out;
	//3'h7: data_mux <= data_outlo;
	endcase
end
endmodule 
