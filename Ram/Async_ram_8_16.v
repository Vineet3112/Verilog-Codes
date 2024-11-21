module Async_ram_16_8(input wr_clk, rd_clk, clr, re, we,
                  input [2:0] rd_add, wr_add, 
                  input [15:0]d_in,
                  output reg [15:0] d_out);
reg [15:0]mem[7:0];
integer i;

always@(posedge wr_clk or posedge clr)
begin
if(clr)
   begin
	for(i = 0; i < 8; i = i+1)
	   begin
		mem[i] <= 0;
	   end
   end 
else
   begin
	if(we)
	   mem[wr_add] <= d_in;
   end
end

always@(posedge rd_clk or posedge clr)
begin
if(clr)
   begin
	d_out <= 0;
   end
else
   begin
	if(re)
	   d_out <= mem[rd_add];
   end
end

endmodule 