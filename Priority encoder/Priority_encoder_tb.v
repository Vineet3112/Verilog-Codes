module Priority_encoder_tb();

reg d0,d1,d2,d3,d4,d5,d6,d7;
wire Y0,Y1,Y2,NV;

Priority_encoder DUT(d0,d1,d2,d3,d4,d5,d6,d7,Y0,Y1,Y2,NV);

task inputs(input [0:7]d);
   begin
	{d0,d1,d2,d3,d4,d5,d6,d7}= d;
	#10;
   end
endtask

initial
   begin
	inputs(8'b0000000);
	inputs(8'b1000000);
	inputs(8'b0100000);
	inputs(8'b0010000);
	inputs(8'b0001000);
	inputs(8'b0000100);
	inputs(8'b0000010);
	inputs(8'b0000001);
   end
endmodule 
