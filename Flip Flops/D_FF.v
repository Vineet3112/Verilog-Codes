module D_FF_synth(input D,clk,rst, output reg Q, output Q_bar);
always@(posedge clk)
   begin
	if(rst)
	   Q <= 1'b0;
	else
	   Q <= D;
   end
  assign Q_bar = ~Q;
endmodule  