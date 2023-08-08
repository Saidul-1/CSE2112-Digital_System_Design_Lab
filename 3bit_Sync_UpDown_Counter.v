/* Dependencies: JK Flip-Flop, T Flip-Flop */
/* During wave simulation in ModelSim,
Set the variable Clk as clock.
Force the value of Clr to 0 only for the first run. 
After the first run, force the value to 1. 
*/
module UpDown_Counter(Q, M, Clk, Clr);
	input M, Clk, Clr;
	output [2:0] Q;
	wire [2:0] Qb;
	wire Mb, and1, and2, and3, and4, t2, t3;
	
	not(Mb,M);
	T_FlipFlop TFF1(Q[0], Qb[0], 1, Clk, Clr);
	and(and1, Q[0], Mb);
	and(and2, Qb[0], M);
	or(t2, and1, and2);

	T_FlipFlop TFF2(Q[1], Qb[1], t2, Clk, Clr);
	and(and3, Q[1], and1);
	and(and4, Qb[1], and2);
	or(t3, and3, and4);
	
	T_FlipFlop TFF3(Q[2], Qb[2], t3, Clk, Clr);
endmodule