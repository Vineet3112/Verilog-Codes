module D_FF_tb ;

reg d,clk,rst;
wire q, qb;

D_FF DUT(d ,clk ,rst ,q ,qb);

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

task d_in(input i);
   begin
   	@(negedge clk)
	  d = i;
   end
endtask 

task initialize;
   begin
	{d,rst} = 1;
   end
endtask

initial
   begin
	initialize;
	rst_dut;
	d_in(1);
	d_in(0);
	d_in(1);
	d_in(0);
	rst_dut;
	d_in(1);
	d_in(1);
	d_in(1);
	#10;
	$finish;
   end

endmodule 