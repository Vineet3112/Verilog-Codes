module Priority_circuit(input i0,i1,i2,i3,i4,i5,i6,i7, output idle,h0,h1,h2,h3,h4,h5,h6,h7);

assign idle = ~i7 & ~i6 & ~i5 & ~i4 & ~i3 & ~i2 & ~i1 & ~i0;
assign h0 = ~i7 & ~i6 & ~i5 & ~i4 & ~i3 & ~i2 & ~i1 & i0;
assign h1 = ~i7 & ~i6 & ~i5 & ~i4 & ~i3 & ~i2 & i1;
assign h2 = ~i7 & ~i6 & ~i5 & ~i4 & ~i3 & i2;
assign h3 = ~i7 & ~i6 & ~i5 & ~i4 & i3;
assign h4 = ~i7 & ~i6 & ~i5 & i4;
assign h5 = ~i7 & ~i6 & i5;
assign h6 = ~i7 & i6;
assign h7 = i7;

endmodule 