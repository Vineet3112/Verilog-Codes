module Vending_Machine(input i,j,rst,clk, output reg x,y);

parameter

IDLE = 2'b00,
s1 = 2'b01,
s2 = 2'b10;

reg [1:0]PS,NS;

always@(posedge clk, posedge rst)
begin
   if(rst)
	PS <= IDLE;
   else
	PS <= NS;
end

always@(i,j,PS)
begin
        NS = IDLE;
case(PS)
	IDLE : NS = i?(j?s2:s1):IDLE;
	s1 : NS = i?(j?IDLE:s2):s1;
	s2 : NS = i?IDLE:s2;
endcase
end 

always@(posedge clk, posedge rst)
begin
   if(rst)
	{x,y} <= 2'b00;
   else
      begin
	{x,y} <= 2'b00;
	case(PS)
		IDLE : {x,y} <= 2'b00;
		s1 : {x,y} <= i?(j?2'b10:2'b00):2'b00;
		s2 : {x,y} <= i?(j?2'b11:2'b10):2'b00;
	endcase
      end	
end
endmodule 