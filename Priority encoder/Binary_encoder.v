module Binary_encoder(input I0,I1,I2,I3,I4,I5,I6,I7, output y0,y1,y2);

assign y0 = I1 | I3 | I5 | I7;
assign y1 = I2 | I3 | I6 | I7;
assign y2 = I4 | I5 | I6 | I7;

endmodule
