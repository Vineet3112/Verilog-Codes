module JK_FF_tb ;

reg J,K,clk,rst;
wire q, qb;

JK_FF DUT(J,K,clk,rst,q,qb);

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

task inputs(input m,n);
   begin
   	@(negedge clk)
	  J = m;
	  K = n;
	  #5;
   end
endtask 

task initialize;
   begin
	{J,K,rst} = 1;
   end
endtask

initial
$monitor("j = %b, k = %b, clk = %b, rst = %b, q = %b, qb = %b", J, K, clk, rst, q, qb);

initial
   begin
	initialize;
	rst_dut;
	inputs (1'b0,1'b0);
	inputs (1'b0,1'b1);
	inputs (1'b1,1'b0);
	inputs (1'b1,1'b1);
	#10;
	$finish;
   end

endmodule 
