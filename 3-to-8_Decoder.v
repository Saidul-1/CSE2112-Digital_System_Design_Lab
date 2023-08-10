module Decoder3to8(O, I);
	input [2:0] I;
	output [7:0] O;
	wire [2:0] Ib;

	not(Ib[0], I[0]);
	not(Ib[1], I[1]);
	not(Ib[2], I[2]);

	and(O[0], Ib[2], Ib[1], Ib[0]);
	and(O[1], Ib[2], Ib[1], I[0]);
	and(O[2], Ib[2], I[1], Ib[0]);
	and(O[3], Ib[2], I[1], I[0]);
	and(O[4], I[2], Ib[1], Ib[0]);
	and(O[5], I[2], Ib[1], I[0]);
	and(O[6], I[2], I[1], Ib[0]);
	and(O[7], I[2], I[1], I[0]);
endmodule

module Decoder3to8_tb;
	reg [2:0] I;
	wire [7:0] O;

	Decoder3to8 dcode3to8(O, I);

	initial begin
	I = 3'b000; #50;	// O=00000001
	I = 3'b001; #50;	// O=00000010
	I = 3'b010; #50;	// O=00000100
	I = 3'b011; #50;	// O=00001000
	I = 3'b100; #50;	// O=00010000
	I = 3'b101; #50;	// O=00100000
	I = 3'b110; #50;	// O=01000000
	I = 3'b111; #50;	// O=10000000
	end
endmodule
