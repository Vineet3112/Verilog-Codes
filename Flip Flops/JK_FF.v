module JK_FF(input J, K, clk, rst, output reg Q, output Qb);

parameter
HOLD = 2'b00,
RESET = 2'b01,
SET = 2'b10,
TOGGLE = 2'b11;

always@(posedge clk)
   begin
     if(rst)
	Q <= 1'b0;
     else
	case({J,K})
	 HOLD : Q <= Q;
	 RESET : Q <= 1'b0;
	 SET : Q <= 1'b1;
	 TOGGLE : Q <= ~Q;
	 default : Q <= 1'bx;
	endcase
   end
  assign Qb = ~Q;
endmodule
