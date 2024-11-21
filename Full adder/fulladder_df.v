module fulladder_df(a,b,cin,sum,c_out);
   input a,b,cin;
   output sum,c_out;			 
   
   assign sum   = a^b^cin;
   assign c_out = (a&b)|(b&cin)|(cin&a);

endmodule 