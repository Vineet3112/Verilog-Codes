module MUX_4_1_tb();

reg d0,d1,d2,d3,s0,s1;
wire y;

MUX4_1 DUT(.a(d0),.b(d1),.c(d2),.d(d3),.s0(s0),.s1(s1),.y(y));

task inputs(input [0:1]s, [0:3]d);
   begin
	{s0,s1}=s;
	{d0,d1,d2,d3}=d;
	#10;
   end
endtask

initial
   begin
	inputs(2'b00, 4'b1000);
	inputs(2'b00, 4'b0100);
	inputs(2'b00, 4'b1010);
	inputs(2'b00, 4'b1001);
   end
endmodule 