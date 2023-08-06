/* Dependencies: Half_Adder, Full_Adder, 4bit_Full_Adder */
module Four_bit_Adder_Subtractor(cout, s, a, b, cin);
	// if cin=0, works as a adder. else, works as a subtractor
	input [3:0] a, b;
	input cin;
	output cout;	
	output [3:0] s;	
	wire [3:0] cin_xor_b;
	
	xor(cin_xor_b[0], b[0], cin);
	xor(cin_xor_b[1], b[1], cin);
	xor(cin_xor_b[2], b[2], cin);
	xor(cin_xor_b[3], b[3], cin);

	Four_bit_Full_Adder FFA(cout, s, a, cin_xor_b, cin);
endmodule

module Four_bit_Adder_Subtractor_tb;
	reg [3:0] a,b;
	reg cin;	
	wire cout;
	wire [3:0] s;

	Four_bit_Adder_Subtractor AddSub(cout, s, a, b, cin);

	initial begin
		cin = 0; a = 4'b1000; b = 4'b0010; #50;
		cin = 0; a = 4'b1000; b = 4'b1000; #50;
		cin = 0; a = 4'b0010; b = 4'b1000; #50;
		cin = 0; a = 4'b0001; b = 4'b0111; #50;
		cin = 0; a = 4'b1010; b = 4'b1011; #50;
		cin = 0; a = 4'b1110; b = 4'b1111; #50;
		cin = 0; a = 4'b1010; b = 4'b1101; #50;
		cin = 1; a = 4'b1000; b = 4'b0010; #50;
		cin = 1; a = 4'b1000; b = 4'b1000; #50;
		cin = 1; a = 4'b0010; b = 4'b1000; #50;
		cin = 1; a = 4'b0001; b = 4'b0111; #50;
		cin = 1; a = 4'b1010; b = 4'b1011; #50;
		cin = 1; a = 4'b1110; b = 4'b1111; #50;
		cin = 1; a = 4'b1010; b = 4'b1101; #50;
	end
endmodule
