module SR_LATCH(input S, R, Gate, output Q, Qb);

wire w1,w2,w3,w4;

nand (w1, S, Gate);
nand (w2, R, Gate);
nand (w3, w1, w4);
nand (w4, w2, w3);

assign Q = w3;
assign Qb = w4;
endmodule 