module Priority_encoder(input [7:0]I, output reg A,B,C,V);

always@(I)
   begin
	V = 1'b1;//default value
   	if(I[7] == 1'b1)
		{A,B,C} = 3'b111;
	else if(I[6] == 1'b1)
		{A,B,C} = 3'b110;
	else if(I[6] == 1'b1)
		{A,B,C} = 3'b110;
	else if(I[5] == 1'b1)
		{A,B,C} = 3'b101;
	else if(I[4] == 1'b1)
		{A,B,C} = 3'b100;
	else if(I[3] == 1'b1)
		{A,B,C} = 3'b011;
	else if(I[2] == 1'b1)
		{A,B,C} = 3'b010;
	else if(I[1] == 1'b1)
		{A,B,C} = 3'b001;
	else if(I[0] == 1'b1)
		{A,B,C} = 3'b000;
	else
	    V = 1'b0;
   end
endmodule
