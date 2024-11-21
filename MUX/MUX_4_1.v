module MUX4_1(input a,b,c,d,s0,s1,output reg y);

always@(*)
begin
if (s0 == 0 & s1 ==0)
y = a;
else if (s0 == 0 & s1 ==1)
y = b;
else if (s0 == 1 & s1 ==0)
y = c;
else
y = d;
end
endmodule

