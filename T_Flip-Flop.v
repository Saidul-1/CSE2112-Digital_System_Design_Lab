/* Dependencies: JK Flip-Flop */
/* During wave simulation in ModelSim,
Set the variable Clk as clock.
Force the value of Clr to 0 only for the first run. 
After the first run, force the value to 1. 
*/
module T_FlipFlop(Q, Qb, T, Clk, Clr);
	input T, Clk, Clr;
	output Q, Qb;
	
	JK_FlipFlop JKFF(Q, Qb, T, T, Clk, Clr);
endmodule