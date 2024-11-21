module Async_ram_16_8_tb();

	reg wr_clk, rd_clk, clr, re, we;
        reg [2:0] rd_add, wr_add; 
        reg [15:0]d_in;
        wire [15:0]d_out;

        integer i, j;

Async_ram_16_8 DUT(wr_clk, rd_clk, clr, re, we, rd_add, wr_add, d_in, d_out);

task initialize;
begin
wr_clk = 1'b0;
rd_clk = 1'b0;
clr = 1'b0;
re = 1'b0;
we = 1'b0;
rd_add = 1'b0;
wr_add = 1'b0;
end
endtask

always #5 wr_clk = ~wr_clk;
always #15 rd_clk = ~rd_clk;

task clr_dut;
begin
clr = 1'b1;
#50
clr = 1'b0;
end
endtask

task write_mem(input [2:0]w, [15:0]data);
begin
   @(negedge wr_clk)
   we = 1'b1;
   wr_add = w;
   d_in = data;
end
endtask

task read_mem(input [2:0]r);
begin
   @(negedge wr_clk)
   re = 1'b1;
   rd_add = r;
end
endtask 

initial
begin
initialize;
#10;
clr_dut;

for (i = 0; i < 8; i=i+1)
begin
write_mem(i, {$random}%16);
end

for (j = 0; j < 8; j=j+1)
begin
read_mem(j);
end
#200 $finish;
end
endmodule 