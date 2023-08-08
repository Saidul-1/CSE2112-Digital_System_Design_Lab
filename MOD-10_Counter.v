/* Dependencies: JK Flip-Flop */
/* During wave simulation in ModelSim,
Set the variable Clk as clock.
Force the value of Clr variable to 0 only for the first run. 
After the first run, set it to NoForce. 
*/
module MOD10_Counter(Q, Clk);
	input Clk;
	output [3:0] Q;
	reg J = 1'b1, K = 1'b1;
	wire [3:0] Qb;
	wire Clr;
	
	nand(Clr, Q[1], Q[3]);

	JK_FlipFlop JKFF0(Q[0], Qb[0], J, K, Clk, Clr);
	JK_FlipFlop JKFF1(Q[1], Qb[1], J, K, Q[0], Clr);
	JK_FlipFlop JKFF2(Q[2], Qb[2], J, K, Q[1], Clr);
	JK_FlipFlop JKFF3(Q[3], Qb[3], J, K, Q[2], Clr);	

endmodule
