module MUX_4_1(input I0,I1,I2,I3,s0,s1 ,output x);
wire w1,w2;

MUX_2_1 M1(.i0(I0),.i1(I1),.s(s0),.y(w1));
MUX_2_1 M2(.i0(I2),.i1(I3),.s(s0),.y(w2));
MUX_2_1 M3(.i0(w1),.i1(w2),.s(s1),.y(x));

endmodule
