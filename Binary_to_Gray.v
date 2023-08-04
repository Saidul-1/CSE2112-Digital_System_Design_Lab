module Binary_to_Gray(g, b);
	input [3:0] b;
	output [3:0] g;

	buf(g[3], b[3]);
	xor(g[2], b[2], b[3]);
	xor(g[1], b[1], b[2]);
	xor(g[0], b[0], b[1]);
endmodule

module Binary_to_Gray_tb;
	reg [3:0] Binary;
	wire [3:0] Gray;

	Binary_to_Gray B2G(.g(Gray), .b(Binary));

	initial begin
		Binary = 4'b0000; #50;
		Binary = 4'b0001; #50;
		Binary = 4'b0010; #50;
		Binary = 4'b0011; #50;
		Binary = 4'b0100; #50;
		Binary = 4'b0101; #50;
		Binary = 4'b0110; #50;
		Binary = 4'b0111; #50;
		Binary = 4'b1000; #50;
		Binary = 4'b1001; #50;
		Binary = 4'b1010; #50;
		Binary = 4'b1011; #50;
		Binary = 4'b1100; #50;
		Binary = 4'b1101; #50;
		Binary = 4'b1110; #50;
		Binary = 4'b1111; #50;
	end
endmodule
