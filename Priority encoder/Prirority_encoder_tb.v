module Priority_encoder_tb();

reg [7:0]I;
wire A,B,C,V;

Priority_encoder DUT(I,A,B,C,V);

task inputs(input[7:0]d);
    begin
	I = d;
	#10;
    end
endtask

initial 
    begin
	inputs(8'b10000000);
	inputs(8'b01000000);
	inputs(8'b00100000);
	inputs(8'b00010000);
	inputs(8'b00001000);
	inputs(8'b00000100);
	inputs(8'b00000010);
	inputs(8'b00000001);
	inputs(8'b00000000);
    end
endmodule
