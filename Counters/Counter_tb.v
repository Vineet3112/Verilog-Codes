module counter_tb();

reg rst, clk;
wire [3:0] d_out;

counter DUT(rst, clk, d_out); 

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
	rst = 1'b0;
   end
endtask

initial 
   begin
	initialize;
	rst_dut;
	#300;
	$finish;
   end

initial
   $monitor("Value of d_out = %d", d_out);

endmodule 
