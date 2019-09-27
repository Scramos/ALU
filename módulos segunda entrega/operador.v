module (instr,dato_A,dato_B, dato_out)

input [7:0] instr;
reg [3:0] A;
reg [3:0] B;
output [3:0] dato_out;
always @(*) begin
if 
	case (instr [7:5])
	3'h0 :  begin
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
	3'h5 : 3 begin

		end
	



end

endmodule 
