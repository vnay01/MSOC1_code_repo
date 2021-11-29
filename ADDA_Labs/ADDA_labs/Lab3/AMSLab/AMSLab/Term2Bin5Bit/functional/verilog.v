// Verilog HDL

`delay_mode_zero

module Term2Bin5Bit(Dout,Din);
  output [4:0] Dout;
  input [0:30] Din;
    wire [4:0] Dout;
    wire [0:30] Din;
    integer c,i;
    reg [4:0] result1, result;
    assign Dout = result1;

always @(Din)
	begin
	begin : block1
		for (i=0;i<31;i=i+1)
			begin
			  if (Din[i] == 0) c=i+1;
			 
			  if (Din[0] == 1) c=0;
			end
		if (c>15)
			begin
			result[4] = 1'b1;
			c = c-16;
			end
		else
			begin
			result[4] = 1'b0;
			end
		if (c>7)
			begin
			result[3] = 1'b1;
			c = c-8;
			end
		else
			begin
			result[3] = 1'b0;
			end
		if (c>3)
			begin
			result[2] = 1'b1;
			c=c-4;
			end
		else
			begin
			result[2] = 1'b0;
			end
		if (c>1)
			begin
			result[1] = 1'b1;
			c=c-2;
			end
		else
			begin
			result[1] = 1'b0;
			end
		result[0] = c;
		result1=result;
		end
	end
endmodule
