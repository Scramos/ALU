module r_shift #(
    parameter inputsize = 8
)(A, enable, /*clock,*/ rsh);

//input clock;
input [0:inputsize - 1] A;
input enable;
output reg [0:inputsize - 1] rsh;

always @ (*) begin

    if (enable) begin
        rsh = A;        //still have issues when deciding if using sinchronous or
        rsh = rsh >> 1; //asinchronous statements
    end

end

endmodule
