module alu_tb();

  reg [7:0]a,b;
  reg [3:0]command;
  reg enable;
  wire [15:0]out;

parameter  
	ADD = 4'b0000,
	INC = 4'b0001,
	SUB = 4'b0010,
	DEC = 4'b0011,
	MUL = 4'b0100,
	DIV = 4'b0101,
	SHL = 4'b0110,
	SHR = 4'b0111,
	AND = 4'b1000,
	OR = 4'b1001,
	INV = 4'b1010,
	NAND = 4'b1011,
	NOR = 4'b1100,
	XOR = 4'b1101,
	XNOR = 4'b1110,
	BUFF = 4'B1111;

reg [4*8:0]string_cmd;

ALU DUT(a,b,command,enable,out);

task initialize;
	begin
	  {a,b,command,enable}=0;
	end
endtask

task en_oe(input i);
	begin
	  enable = i;
	end
endtask

task inputs(input m,n);
	begin
	  a = m;
	  b = n;
	end
endtask

task cmd(input [3:0]t);
	begin 
	  command = t;
	end
endtask

always@(command)
    begin
	case(command)
	
	ADD	: string_cmd = "ADD";
	INC	: string_cmd = "INC";
	SUB	: string_cmd = "SUB";
	DEC	: string_cmd = "DEC";
	MUL	: string_cmd = "MUL";
	DIV	: string_cmd = "DIV";
	SHL	: string_cmd = "SHL";
	SHR	: string_cmd = "SHR";
	AND	: string_cmd = "AND";
	OR  	: string_cmd = "OR";
	INV	: string_cmd = "INV";
	NAND	: string_cmd = "NAND";
	NOR	: string_cmd = "NOR";
	XOR	: string_cmd = "XOR";
	XNOR	: string_cmd = "XNOR";
	BUFF	: string_cmd = "BUFF";

	endcase
    end

initial
    begin
	initialize;
	en_oe(1'b1);
	inputs(8'd20,8'd10);
	cmd(ADD);
	#5;

	inputs(8'd20,8'd10);
	cmd(SUB);
	#5;

	inputs(8'd5,8'd4);
	cmd(MUL);
	#5;

	inputs(8'd20,8'd10);
	cmd(DIV);
	#5;

	inputs(8'd1,8'd7);
	cmd(AND);
	#5;

	inputs(8'd1,8'd2);
	cmd(OR);
	#5;
    end

endmodule 