module MUX_2_1(input i0,i1,s ,output y);

assign y = (~s & i0) | (s & i1);

endmodule
