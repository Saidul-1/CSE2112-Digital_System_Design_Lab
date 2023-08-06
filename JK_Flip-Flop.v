/* During wave simulation in ModelSim,
Set the variable clk as clock.
Force the value of clr to 0 only for the first run. 
After the first run, force the value to 1. 
*/
module JK_FlipFlop(Q, Qb, J, K, clr, clk);
	input J, K, clr, clk;
	output Q, Qb;
	wire w1, w2, w3, w4, w5, w6, w7;

	nand(w1, J, Qb, clk, clr);
	nand(w2, K, Q, clk);
	nand(w3, w1, w4);
	nand(w4, w3, w2, clr);

	not(w7, clk);

	nand(w5, w7, w3);
	nand(w6, w4, w7);
	nand(Q, Qb, w5);
	nand(Qb, Q, w6, clr);
endmodule