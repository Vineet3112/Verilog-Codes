module Up_counter_4(input [3:0]d_in, input load, rst, clk, output reg [3:0]d_out);

always@(posedge clk)
  begin
   if(~rst)
	d_out <= 0;
   else if(load)
	d_out <= d_in;
   else 
	d_out <= d_out + 1'b1;
  end
endmodule 