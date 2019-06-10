module Condcheck(input logic [3:0] Cond,
					  input logic [3:0] ALUFlags,
					  output logic CondEx);

	//logic N = 0;
	//logic Z = 0;
	//logic C = 0;
	//logic V = 0;
	//logic GE = 0;


	assign {N, Z, C, V} = ALUFlags;
	assign GE = (N == V);

	always_comb
		case(Cond)
			4'b0000: CondEx = Z; // EQ
			4'b0001: CondEx = ~Z; // NE
			4'b0010: CondEx = C; // CS
			4'b0011: CondEx = ~C; // CC
			4'b0100: CondEx = N; // MI
			4'b0101: CondEx = ~N; // PL
			4'b0110: CondEx = V; // VS
			4'b0111: CondEx = ~V; // VC
			4'b1000: CondEx = C & ~Z; // HI
			4'b1001: CondEx = ~(C & ~Z); // LS
			4'b1010: CondEx = GE; // GE
			4'b1011: CondEx = ~GE; // LT
			4'b1100: CondEx = ~Z & GE; // GT
			4'b1101: CondEx = ~(~Z & GE); // LE
			4'b1110: CondEx = 1'b1; // Always
			default: CondEx = 1'bx; // undefined
		endcase
endmodule
