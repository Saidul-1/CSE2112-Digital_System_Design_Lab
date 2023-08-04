module BCD_to_Excess3(e, b);
	input [3:0] b;
	output [3:0] e;
	wire w1, w2;

	not(e[0], b[0]); // e[0] bit (LSB)
	xnor(e[1], b[0], b[1]); // e[1] bit
	or(w1, b[0], b[1]);
	xor(e[2], w1, b[2]); // e[2] bit
	and(w2, w1, b[2]);
	or(e[3], w2, b[3]);// e[3] bit (MSB)
endmodule

module BCD_to_Excess3_tb;
	reg [3:0] B;
	wire [3:0] E;
	integer i;

	BCD_to_Excess3 excess3(.e(E), .b(B));
	initial begin
		for (i = 0; i < 10; i=i+1) begin
			B = i;
			#50;
			$display("BCD = %4b => Excess-3 = %4b", B, E);
		end	
	end
endmodule

