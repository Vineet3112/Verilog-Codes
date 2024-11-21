module s_ram_16_8_tb();

parameter

add_size = 4,
ram_width = 8,
ram_depth = 16;

reg clk, rst, read, write;
reg [add_size-1:0]rd_add, wr_add;
reg [ram_width-1:0]d_in;
wire [ram_depth-1:0]d_out;
integer i;

s_ram_16_8 DUT(clk, rst, read, write, rd_add, wr_add, d_in, d_out);

initial
begin
   clk = 0;
   forever #5 clk = ~clk;
end

task rst_dt;
begin
   @(negedge clk)
   rst = 1'b1;
   @(negedge clk)
   rst = 1'b0;
end
endtask

task write_t(input [7:0]a, input [3:0]b, input w,r);
begin
@(negedge clk);
write = w;
read = r;
d_in = a;
wr_add = b;
end
endtask

task read_t(input [3:0]a, input w,r);
begin
@(negedge clk);
write = w;
read = r;
rd_add = a;
end
endtask

task initialize;
begin
{write,read,rst} = 0;
end
endtask

initial
begin
   initialize;
   rst_dt;
   repeat(10)
   write_t({$random}%256,{$random}%16,1'b1,1'b0);
   repeat(10)
   read_t({$random}%16,1'b0,1'b1);
   $monitor("clk = %d, rst = %d, r = %d, w = %d, rd_add = %b, wr_add = %b, d_in = %b, d_out = %b",clk, rst, read, write, rd_add, wr_add, d_in, d_out);
   #100 $finish;
end 
endmodule 