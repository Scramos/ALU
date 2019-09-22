module save(done,pos_save,data_result,save,active,data_AB,data_outA,data_outB
);
input pos_save,active,done;
input [7:0] data_AB;
input [3:0] data_result;
output [3:0] data_outA;
output [3:0]data_outB;

always @(active,done) begin
    if (pos_save) begin
        if (active) begin
        data_outA <= data_AB[7:4];
        data_outB <= data_AB[3:0];
        end
        if (done) begin
        data_outA<= data_result;           
        end
    end     
    else begin
        if (active) begin
        data_outB<= data_AB[7:4];
        data_outA<= data_AB[3:0];           
        end
        if (done) begin
        data_outB<= data_result;   
        end       
    end    
 end


endmodule // savepos_save,data_result,save,