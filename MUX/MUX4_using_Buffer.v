module MUX4_Buffer(input s0,s1,d0,d1,d2,d3,output wor y);

wire w0,w1,w2,w3;

decoder_2_4 D1(.a(s0),.b(s1),.y0(w0),.y1(w1),.y2(w2),.y3(w3));

bufif1 B1(y, d0, w0);
bufif1 B2(y, d1, w1);
bufif1 B3(y, d2, w2);
bufif1 B4(y, d3, w3);

endmodule 