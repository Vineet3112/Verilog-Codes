module Async_s_port_ram_tb();

reg re, we;
wire [15:0]data;
reg [2:0]addr;
reg [15:0]temp;
integer i;

Async_s_port_ram DUT(re,we,data,addr);

task initialize;
begin
re = 1'b0;
we = 1'b0;
addr = 3'b0;
temp = 16'b0;
end 
endtask

assign data = (we && ~re) ? temp : 16'bz;

task write_mem();
begin
we = 1'b1;
re = 1'b0;
end
endtask

task read_mem();
begin
re = 1'b1;
we = 1'b0;
end
endtask

task stimulus_w(input [2:0]a, input[15:0]d);
begin
addr = a;
temp = d;
end
endtask 

task stimulus_r(input [2:0]s);
begin
addr = s;
end
endtask

initial 
begin
initialize;
#10;
write_mem;
   for(i = 0; i < 8; i = i+1)
	begin
	  stimulus_w(i, {$random}%65536);	
	  #10;
	end   
read_mem;
   for(i = 0; i < 8; i = i+1)
	begin
	  stimulus_r(i);
	  #10;
	end
#200 $finish;
end
endmodule 