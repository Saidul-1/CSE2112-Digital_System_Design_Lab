module BCD_to_Excess3(e, b);
	input [3:0] b;
	output [3:0] e;
	wire w1, w2; 			// w1=b[0]|b[1], w2=w1&b[2];

	not(e[0], b[0]); 		// e[0] bit (LSB)
	xnor(e[1], b[0], b[1]); // e[1] bit
	or(w1, b[0], b[1]);
	xor(e[2], w1, b[2]); 	// e[2] bit
	and(w2, w1, b[2]);
	or(e[3], w2, b[3]);		// e[3] bit (MSB)
endmodule

module BCD_to_Excess3_tb;
	reg [3:0] BCD;
	wire [3:0] Excess3;

	BCD_to_Excess3 excess3(.e(Excess3), .b(BCD));

	initial begin
		BCD = 4'b0000; #50;
		BCD = 4'b0001; #50;
		BCD = 4'b0010; #50;
		BCD = 4'b0011; #50;
		BCD = 4'b0100; #50;
		BCD = 4'b0101; #50;
		BCD = 4'b0110; #50;
		BCD = 4'b0111; #50;
		BCD = 4'b1000; #50;
		BCD = 4'b1001; #50;
		// input 4'b1010 to 4'b1111 were ignored
	end
endmodule

