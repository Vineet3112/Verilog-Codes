module Ripple_adder_tb();

reg [3:0]A,B;
reg C_in;
wire C_out;
wire [3:0]S;

Ripple_adder DUT(A,B,C_in,S,C_out);

task inputs(input [3:0]x,y, input z);
    begin
	A = x;
	B = y;
	C_in = z;
	#5;
    end
endtask

initial
    begin
	inputs(4'd2,4'd2,1'b0);
	inputs(4'd2,4'd4,1'b0);
	inputs(4'd6,4'd4,1'b1);
	inputs(4'd5,4'd5,1'b1);
    end
endmodule 