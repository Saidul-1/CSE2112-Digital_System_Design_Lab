/* Dependencies: JK Flip-Flop */
/* During wave simulation in ModelSim,
Set the variable clk as clock.
Force the value of clr variable to 0 only for the first run. 
After the first run, set it to NoForce. 
*/
module MOD10_Counter(Q, clk);
	input clk;
	output [3:0] Q;
	reg J = 1'b1, K = 1'b1;
	wire [3:0] Qb;
	wire clr;
	
	nand(clr, Q[1], Q[3]);

	JK_FlipFlop jkff0(Q[0], Qb[0], J, K, clr, clk);
	JK_FlipFlop jkff1(Q[1], Qb[1], J, K, clr, Q[0]);
	JK_FlipFlop jkff2(Q[2], Qb[2], J, K, clr, Q[1]);
	JK_FlipFlop jkff3(Q[3], Qb[3], J, K, clr, Q[2]);	

endmodule