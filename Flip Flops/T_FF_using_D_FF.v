module T_FF_using_D_FF(T, clk, rst, Q, Qb);

input T, clk, rst;
inout Q;
output Qb;

wire w1,w2;

assign w1 = Q;
assign w2 = Qb;
D_FF_synth D1(w1, clk, rst, Q, Qb);

endmodule
