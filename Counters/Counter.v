module counter(input rst, clk, output reg [3:0]out);

always@(posedge clk)
  begin 
   if(rst)
	out <= 4'b0000;
   else if(out == 4'b1111)
	out <= 4'b0000;
   else 
	out <= out + 2'd2;
  end
endmodule 
