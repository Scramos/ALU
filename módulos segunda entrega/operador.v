module (instr,dato_A,dato_B,dato_out,clk,dato_mux)

input [7:0] instr;
reg [3:0] A;
reg [3:0] B;
output [3:0] dato_out;
always @(clk) begin

	case (instr [7:5])
	3'h0 : begin
		A <= instr[3:0];
 		B <= instr[3:0]; 
		dato_out <= A+B;

		end 
	3'h1:  begin
		A <= instr[3:0];
		dato_out <= ~A;
		end
	3'h2 : begin
		A <= instr[3:0];
		dato_out <= {A[2:0], 1'b0};
		end
	3'h3 :  begin
		A <= instr[3:0];
		dato_out <= {1'b0; A[3:1]};
		end
	3'h4 :  begin
		A <= instr[3:0];
 		B <= instr[3:0];
        	if (A == B) begin
        	
 		dato_out <= 1;
        	end else begin
        	dato_out <= 0;
		end
	3'h6 :  begin
		A <= instr[3:0];
		B <= instr[3:0];
		if (A > B) begin
		dato_out <=1;
		end else begin
		dato_out <=0;

		end
	3'h5 :  begin
		data_out <= instr[3:0];

		end

	3'h7 :  begin 
		data_out <=instr[3:0];

		end
	endcase



end
always @(*) begin

	case (instr[3:0]) 
	3'h0: data_mux <= data_out; 
	3'h1: data_mux <= data_out;
	3'h2: data_mux <= data_out;
	3'h3: data_mux <= data_out;
	3'h4: data_mux <= data_out;
	3'h5: data_mux <= data_out;
	//3'h6: data_mux <= data_out;
	3'h7: data_mux <= data_out;
	endcase
endmodule 
