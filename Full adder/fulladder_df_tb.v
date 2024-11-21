module full_adder_tb();
   reg a,b,c_in;
   wire sum,carry;
   integer i;
   fulladder_df FA1(.a(a),.b(b),.cin(c_in),.sum(sum),.c_out(carry));			
   initial
      begin 
	 for(i=0;i<8;i=i+1)
	    begin
	       {a,b,c_in}=i;
	       #10;
	    end
	#20 $finish;
      end
   initial 
      $monitor("Input a=%b, b=%b, c=%b, Output sum =%b, carry=%b",a,b,c_in,sum,carry);
endmodule 