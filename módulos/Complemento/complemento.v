module complemento #(
    parameter inputsize = 8
)(clock, A, enable, rc);

input clock;
input [0:inputsize - 1] A;
input enable;
output reg [0:inputsize - 1] rc;

always @ (posedge clock) begin

    if (enable) begin
        rc <= ~A;
    end

end

endmodule