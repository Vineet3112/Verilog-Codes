module Vending_Machine_tb;

reg i,j,clk,rst;
wire x, y;

Vending_Machine DUT(i,j,rst,clk,x,y);

initial
   begin
	clk = 0;
	forever #10 clk = ~clk;
   end

task rst_dut;
   begin
   	@(negedge clk)
  	  rst = 1;
   	@(negedge clk)
	  rst = 0;
   end
endtask 

task inputs(input [1:0]m);
   begin
   	@(negedge clk)
	  {i,j} = m;
	  #5;
   end
endtask 

task initialize;
   begin
	{i,j,rst} = 1;
   end
endtask

initial
   begin
	initialize;
	rst_dut;
	inputs (2'b10);
	inputs (2'b10);
	inputs (2'b11);
	inputs (2'b10);
	inputs (2'b11);
	inputs (2'b00);
	$finish;
   end

endmodule 
