/* Sequence: 0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000 */
/* Dependencies: JK Flip-Flop, T Flip-Flop */
/* During wave simulation in ModelSim,
Set the variable Clk as clock.
Force the value of Clr variable to 0 only for the first run. 
After the first run, Force the value to 1. 
*/
module Sequential_Counter(Q, Clk, Clr);
	input Clk, Clr;
	output [3:0] Q;
	wire [3:0] Qb, t;

	xor(t[0], Q[0], Q[1]);
	T_FlipFlop TFF0(Q[0], Qb[0], t[0], Clk, Clr);

	xor(t[1], Q[1], Q[2]);
	T_FlipFlop TFF1(Q[1], Qb[1], t[1], Clk, Clr);

	xor(t[2], Q[2], Q[3]);
	T_FlipFlop TFF2(Q[2], Qb[2], t[2], Clk, Clr);

	xnor(t[3], Q[0], Q[3]);
	T_FlipFlop TFF3(Q[3], Qb[3], t[3], Clk, Clr);	

endmodule
