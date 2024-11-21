module s_ram_16_8(clk, rst, read, write, rd_add, wr_add, d_in, d_out);

parameter

add_size = 4,
ram_width = 8,
ram_depth = 16;

input clk, rst, read, write;
input [add_size-1:0]rd_add, wr_add;
input [ram_width-1:0]d_in;
output reg [ram_depth-1:0]d_out;
integer i;

reg [ram_width-1:0]mem[ram_depth-1:0];

always@(posedge clk)
begin
   if(rst)
	begin
	   d_out <= 0;
	   for(i = 0; i < ram_depth; i=i+1)
		mem[i] <= 0;
	end
   else
	begin
	   if(write)
		mem[wr_add] <= d_in;
	   if(read)
		d_out <= mem[rd_add];
	end
end
endmodule
