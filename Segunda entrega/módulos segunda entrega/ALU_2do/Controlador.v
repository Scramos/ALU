module Controlador #()(read_Instr,init_Memory,doneCalcule, initrd, doneresult);

input doneCalcule;
input doneresult;
input read_Instr;
output  reg init_Memory;
output reg initrd;

always @(posedge read_Instr) begin
   // if (read_Instr == 1) begin  
         init_Memory <= 1'b1;
         if (doneCalcule == 1) begin

            initrd <= 1'b1;
            if (doneCalcule == 1) begin
                init_Memory <= 1'b0;
                initrd <= 1'b0;
            end
             
         end

   // end
    
end

endmodule // Controlador #read_Instr,Init_Memory, init