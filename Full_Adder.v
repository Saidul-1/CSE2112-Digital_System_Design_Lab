/* Dependencies: Half_Adder */
module Full_Adder(sum, cout, a, b, cin);
	input a, b, cin;
	output sum, cout;
	wire s1, cout1, cout2;

	Half_Adder HA1(s1, cout1, a, b);
	Half_Adder HA2(sum, cout2, s1, cin);
	or(cout,cout1,cout2);
endmodule
