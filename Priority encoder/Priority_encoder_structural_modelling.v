module Priority_encoder(input d0,d1,d2,d3,d4,d5,d6,d7, output Y0,Y1,Y2,NV);
wire w0,w1,w2,w3,w4,w5,w6,w7;

Priority_circuit DUT1(.i0(d0),.i1(d1),.i2(d2),.i3(d3),.i4(d4),.i5(d5),.i6(d6),.i7(d7),.h0(w0),.h1(w1),.h2(w2),.h3(w3),.h4(w4),.h5(w5),.h6(w6),.h7(w7),.idle(NV));
Binary_encoder DUT2(.I0(w0),.I1(w1),.I2(w2),.I3(w3),.I4(w4),.I5(w5),.I6(w6),.I7(w7),.y0(Y0),.y1(Y1),.y2(Y2));

endmodule
