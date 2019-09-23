module a_igual_b #(
    parameter inputsize = 4
)(A, B, /*clk,*/ enable, ab_out, done);


input enable;
//input clk;
input [0:inputsize - 1] A;
input [0:inputsize - 1] B;
output reg ab_out;
output reg done;

always @ (*) begin

    if (enable) begin
        if (A == B) begin
            ab_out <= 1;
        end else begin
            ab_out <= 0;
        end
        done = 1;
    end else begin
        done = 0;
    end

end

endmodule