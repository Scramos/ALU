module (instr,dato_A,dato_B,dato_outsum,dato_outcomp,dato_outsl,dato_outsr,dato_outcmi,dato_outcmm, dato_outlo,clk,dato_mux)

input clk
input [7:0] instr;
reg [3:0] A;
reg [3:0] B;
reg [3:0] dato_outsum;
reg [3:0] dato_outcomp;
reg [3:0] dato_outsl;
reg [3:0] dato_outsr;
reg [3:0] dato_outscmi;
reg [3:0] dato_outcmm;
reg [3:0] dato_outlo;
output [3:0] dato_mux;
always @(clk) begin

	case (instr [7:5])
	3'h0 : begin
		A <= instr[3:0]; // Guarda el dato en el registro A
 		B <= instr[3:0]; // Guarda el dato en el registro B
		dato_outsum <= A+B; // Realiza la suma de A y B y lo guarda en dato_outsum
		end 
	3'h1:  begin
		A <= instr[3:0]; // Guarda el dato en el registro A
		dato_outcomp <= ~A; //Hace el complemento y lo guarda en dato_outcomp
		end
	3'h2 : begin
		A <= instr[3:0]; // Guarda el dato en el registro A
		dato_outsl <= {A[2:0], 1'b0}; // Toma desde el bit más significativo tres datos y luego lo concatena con un cero en la posición menos significativa y lo guarda.
		end
	3'h3 :  begin
		A <= instr[3:0]; // Guarda el dato en el registro A
		dato_outsr <= {1'b0; A[3:1]}; // Toma desde el bit menos significativo tres datos y los concatena con un cero en el posición más significativa. 
		end
	3'h4 :  begin
		A <= instr[3:0]; // Guarda el dato en el registro A
 		B <= instr[3:0]; // Guarda el dato en el registro B
        	if (A == B) begin //Realiza la comparación de igualdad entre A y B   	
 		dato_outcmi <= 1; //Envía un 1 dado que la comparación es cierta
        	end else begin
        	dato_out <= 0; //Envía un cero cuando la comparación es falsa
		end
	3'h5 :  begin
		A <= instr[3:0]; // Guarda el dato en el registro A
		B <= instr[3:0]; // Guarda el dato en el registro B
		if (A > B) begin // Realiza la comparación de mayoría entre A y B
		dato_outcmm <=1; // Envía uno si A es mayor a B
		end else begin
		dato_out <=0; // Envía cero en caso contrario
		end
	3'h6 :  begin
		dato_outsa <= instr[3:0] // Guarda el dato en el registro A
		
		end

	3'h7 :  begin 
		data_outlo <=instr[3:0]; // Guarda el dato en el registro A

		end
	endcase



end
always @(clk) begin

	case (instr[3:0]) 
	3'h0: data_mux <= data_outsum; 
	3'h1: data_mux <= data_outcomp;
	3'h2: data_mux <= data_outsl;
	3'h3: data_mux <= data_outsr;
	3'h4: data_mux <= data_outcmi;
	3'h5: data_mux <= data_outcmm;
	//3'h6: data_mux <= data_out;
	3'h7: data_mux <= data_outlo;
	endcase
endmodule 
