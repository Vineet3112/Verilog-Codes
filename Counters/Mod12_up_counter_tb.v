module module_up_counter_tb();

reg rst, clk;
wire [3:0] d_out;

module_up_counter DUT(rst, clk, d_out); 

initial
   begin
   	clk = 0;
   	forever #10 clk = ~clk;
   end

task rst_dut;
   begin
	@(negedge clk);
	rst = 0;
	@(negedge clk);
	rst = 1;
   end
endtask

initial 
   begin
	rst_dut;
	#200;
	$finish;
   end
endmodule 
