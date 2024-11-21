module MUX_4_1_tb();

reg d0,d1,d2,d3,s0,s1;
wire y;

MUX_4_1 DUT(s0,s1,d0,d1,d2,d3,y);

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