/* During wave simulation in ModelSim,
Set the variable Clk as clock.
Force the value of Clr to 0 only for the first run. 
After the first run, force the value to 1. 
*/
module JK_FlipFlop(Q, Qb, J, K, Clk, Clr);
	input J, K, Clk, Clr;
	output Q, Qb;
	wire w1, w2, w3, w4, w5, Q1, Qb1, Clkb;

	nand(w1, J, Qb, Clk, Clr);
	nand(w2, K, Q, Clk);
	nand(Q1, w1, Qb1);
	nand(Qb1, w2, Q1, Clr);

	not(Clkb, Clk);

	nand(w3, Q1, Clkb);
	nand(w4, Qb1, Clkb);
	nand(Q, w3, Qb);
	nand(Qb, w4, Q, Clr);
endmodule
