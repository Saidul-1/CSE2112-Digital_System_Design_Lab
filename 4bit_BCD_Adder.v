/* dependencies: Half_Adder, Full_Adder, 4bit_Full_Adder */
module BCD_Adder(cout, s, a, b, cin);
	input [3:0]a;
	input [3:0]b;
	input cin;
	output [3:0]s;
	output cout;
	wire [3:0]s1,b2;
	wire and1,and2,or1,carry1,carry2;

	Four_bit_Full_Adder FFA1(carry1,s1,a,b,cin);

	and (and1,s1[3],s1[2]);
	and (and2,s1[3],s1[1]);
	or (or1,and1,and2);
	or(cout,carry1,or1);		

	buf(b2[0],0);
	buf(b2[3],0);
	buf(b2[1],cout);
	buf(b2[2],cout);
	buf(cin,0);

	Four_bit_Full_Adder FFA2(carry2,s,s1,b2,cin);

endmodule

module BCD_Adder_tb;
	reg [3:0] a, b;
	reg cin;
	wire cout;
	wire [3:0] s;

	BCD_Adder BA(cout, s, a, b, cin);

	initial begin
		cin=0; 
		a = 4'b0000; b = 4'b0000; #50;
		a = 4'b0000; b = 4'b0001; #50;
		a = 4'b0001; b = 4'b0001; #50;
		a = 4'b0010; b = 4'b0001; #50;
		a = 4'b0010; b = 4'b0010; #50;
		a = 4'b0010; b = 4'b0011; #50;
		a = 4'b0101; b = 4'b0001; #50;
		a = 4'b0101; b = 4'b0010; #50;
		a = 4'b1000; b = 4'b0000; #50;
		a = 4'b0110; b = 4'b0011; #50;
		a = 4'b1000; b = 4'b0010; #50;
		a = 4'b1000; b = 4'b0011; #50;
		a = 4'b1000; b = 4'b0100; #50;
		a = 4'b1011; b = 4'b0010; #50;
		a = 4'b0101; b = 4'b1001; #50;
		a = 4'b0111; b = 4'b1000; #50;
		a = 4'b1001; b = 4'b0111; #50;
		a = 4'b1011; b = 4'b0110; #50;
		a = 4'b1101; b = 4'b0101; #50;
		a = 4'b1111; b = 4'b0100; #50;
	end
endmodule