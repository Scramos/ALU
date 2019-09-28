module (instr,dato_A,dato_B,dato_outsum,dato_outcomp,dato_outsl,dato_outsr,dato_outcmi,dato_outcmm, dato_outlo,clk,dato_mux)

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
		A <= instr[3:0];
 		B <= instr[3:0]; 
		dato_outsum <= A+B;

		end 
	3'h1:  begin
		A <= instr[3:0];
		dato_outcomp <= ~A;
		end
	3'h2 : begin
		A <= instr[3:0];
		dato_outsl <= {A[2:0], 1'b0};
		end
	3'h3 :  begin
		A <= instr[3:0];
		dato_outsr <= {1'b0; A[3:1]};
		end
	3'h4 :  begin
		A <= instr[3:0];
 		B <= instr[3:0];
        	if (A == B) begin
        	
 		dato_outcmi <= 1;
        	end else begin
        	dato_out <= 0;
		end
	3'h6 :  begin
		A <= instr[3:0];
		B <= instr[3:0];
		if (A > B) begin
		dato_outcmm <=1;
		end else begin
		dato_out <=0;

		end
	3'h5 :  begin
		
		
		end

	3'h7 :  begin 
		data_outlo <=instr[3:0];

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
