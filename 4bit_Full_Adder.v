/* Dependencies: Half_Adder, Full_Adder */
module Four_bit_Full_Adder(cout, s, a, b, cin);
	input [3:0]a,b;
	input cin;
	output cout;
	output [3:0]s;
	wire c0,c1,c2;

	Full_Adder f1(s[0],c0,a[0],b[0],cin);
	Full_Adder f2(s[1],c1,a[1],b[1],c0);
	Full_Adder f3(s[2],c2,a[2],b[2],c1);
	Full_Adder f4(s[3],cout,a[3],b[3],c2);
endmodule
