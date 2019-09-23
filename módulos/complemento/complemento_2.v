module complemento #(
    parameter inputsize = 4
)(/*clock,*/ A, enable, rc);

//input clock;
input [0:inputsize - 1] A;
input enable;
output reg [0:inputsize - 1] rc;

always @ (*) begin

    if (enable) begin
        rc <= ~A;
    end

end

endmodule
