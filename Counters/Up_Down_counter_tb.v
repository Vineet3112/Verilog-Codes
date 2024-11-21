module Up_Down_counter_tb();

reg rst, clk, mode;
wire [3:0] d_out;

Up_Down_counter DUT(rst, clk, mode, d_out); 

initial
   begin
   	clk = 0;
   	forever #10 clk = ~clk;
   end

task rst_dut;
   begin
	@(negedge clk);
	rst = 1;
	@(negedge clk);
	rst = 0;
   end
endtask

task initialize;
   begin
	{rst, mode} = 0;
   end
endtask

initial 
   begin
	initialize;
	rst_dut;
	@(negedge clk);
	mode = 1'b0;
	#50;
	@(negedge clk);
	mode = 1'b1;
	#50;
	$finish;
   end
endmodule 
