module SR_LATCH_tb();
		
   reg S,R,G;
   wire q,qb; 
   integer i;

   SR_LATCH SR1(.S(S),.R(R),.Gate(G),.Q(q),.Qb(qb));
   
   initial
      begin 
	 for (i=0;i<8;i=i+1)
	    begin
	       {S,R,G}=i;
	       #10;
	    end
      end
				
  
   initial 
      $monitor("Input S=%b, R=%b, G=%b, Output q=%b, qb=%b",S,R,G,q,qb);
								
   initial #100 $finish;
			
   
endmodule
