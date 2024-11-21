module Ripple_adder(input [0:3]a,b, input c_in, output [0:3]s, output c_out);
wire w1,w2,w3;

full_adder FA1(.a_in(a[0]), .b_in(b[0]), .c_in(c_in), .sum_out(s[0]), .carry_out(w1));
full_adder FA2(.a_in(a[1]), .b_in(b[1]), .c_in(w1), .sum_out(s[1]), .carry_out(w2));
full_adder FA3(.a_in(a[2]), .b_in(b[2]), .c_in(w2), .sum_out(s[2]), .carry_out(w3));
full_adder FA4(.a_in(a[3]), .b_in(b[3]), .c_in(w3), .sum_out(s[3]), .carry_out(c_out));

endmodule 