module Up_counter_4_tb();

reg [3:0] d_in;
reg load, rst, clk;
wire [3:0] d_out;

Up_counter_4 DUT(d_in, load, rst, clk, d_out); 

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

task inputs(input m, input [3:0]n);
   begin
	@(negedge clk);
	load = m;
	d_in = n;
   end
endtask

initial 
   begin
	rst_dut;
	#50;
	inputs (1'b1, 4'd15);
	inputs (1'b0, 4'd15);
	#100;
	$finish;
   end
endmodule 