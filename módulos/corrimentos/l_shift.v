module l_shift #(
    parameter inputsize = 8
)(A, enable, /*clock*/, lsh);

//input clock;
input [0:inputsize - 1] A;
input enable;
output reg [0:inputsize - 1] lsh;

always @ (*) begin

    if (enable) begin
        lsh = A;        //still have issues when deciding if using sinchronous or
        lsh = lsh << 1; //asinchronous statements
    end

end

endmodule
