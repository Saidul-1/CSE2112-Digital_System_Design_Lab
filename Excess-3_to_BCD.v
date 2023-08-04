module Excess3_to_BCD(b, e);
	input [3:0] e;
	output [3:0] b;
	wire w1,w2; 			// w1=e[0]|e[1], w2=w1&e[2];

	not(b[0], e[0]);
	xor(b[1], e[1], e[0]);
	and(w1, e[0], e[1]);
	xnor(b[2], w1, e[2]);
	or(w2, w1, e[2]);
	and(b[3], w2, e[3]);
endmodule

module Excess3_to_BCD_tb;
	reg [3:0] Excess3;
	wire [3:0] BCD;

	Excess3_to_BCD e2b(.b(BCD), .e(Excess3));

	initial begin
		// input 4'b0000 to 4'b0010 were ignored
		Excess3 = 4'b0011; #50;
		Excess3 = 4'b0100; #50;
		Excess3 = 4'b0101; #50;
		Excess3 = 4'b0110; #50;
		Excess3 = 4'b0111; #50;
		Excess3 = 4'b1000; #50;
		Excess3 = 4'b1001; #50;
		Excess3 = 4'b1010; #50;
		Excess3 = 4'b1011; #50;
		Excess3 = 4'b1100; #50;
		// input 4'b1101 to 4'b1111 were ignored
	end
endmodule