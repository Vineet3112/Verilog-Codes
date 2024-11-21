module T_FF_tb ;

reg T,clk,rst;
wire q, qb;

T_FF DUT(T ,clk ,rst ,q ,qb);

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

task t_in(input i);
   begin
   	@(negedge clk)
	  T = i;
   end
endtask 

task initialize;
   begin
	{T,rst} = 1;
   end
endtask

initial
   begin
	initialize;
	rst_dut;
	t_in(1);
	t_in(1);
	t_in(1);
	t_in(0);
	rst_dut;
	t_in(1);
	t_in(0);
	t_in(1);
	#10;
	$finish;
   end

endmodule 
