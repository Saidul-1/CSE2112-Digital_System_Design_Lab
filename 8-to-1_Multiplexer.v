module Multiplexer8to1(out, I, S, E);
	input [7:0] I;
	input [2:0] S;
	input E;
	output out;
	wire [2:0] Sb;
	wire [7:0] y;
	wire w;

	not(Sb[0], S[0]);
	not(Sb[1], S[1]);
	not(Sb[2], S[2]);

	and(y[0], I[0], Sb[2], Sb[1], Sb[0]);
	and(y[1], I[1], Sb[2], Sb[1], S[0]);
	and(y[2], I[2], Sb[2], S[1], Sb[0]);
	and(y[3], I[3], Sb[2], S[1], S[0]);
	and(y[4], I[4], S[2], Sb[1], Sb[0]);
	and(y[5], I[5], S[2], Sb[1], S[0]);
	and(y[6], I[6], S[2], S[1], Sb[0]);
	and(y[7], I[7], S[2], S[1], S[0]);

	or(w, y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);

	and(out, w, E);
endmodule

module Multiplexer8to1_tb;
	reg [7:0] I;
	reg [2:0] S;
	reg E;
	wire out;

	Multiplexer8to1 mux8to1(out, I, S, E);

	initial begin
	E = 1'b1;	I = 8'b01011010;
	S = 3'b000; #50;	//out = I[0]
	S = 3'b001; #50;	//out = I[1]
	S = 3'b010; #50;	//out = I[2]
	S = 3'b011; #50;	//out = I[3]
	S = 3'b100; #50;	//out = I[4]
	S = 3'b101; #50;	//out = I[5]
	S = 3'b110; #50;	//out = I[6]
	S = 3'b111; #50;	//out = I[7]
	end
endmodule
