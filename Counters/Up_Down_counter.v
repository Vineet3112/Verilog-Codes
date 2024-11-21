module Up_Down_counter(input rst, clk, mode, output reg [3:0]d_out);

always@(posedge clk)
  begin 
   if(rst)
	d_out <= 4'b0000;
   else
	begin
	   case(mode) 
	      1'b0 : d_out <= d_out + 1'b1;
	      1'b1 : d_out <= d_out - 1'b1;
	      default : d_out <= 4'bxxxx;
	   endcase
        end
   end
endmodule 
