module Condcheck(input logic [3:0] Cond,
					  input logic [3:0] ALUFlags,
					  output logic CondEx);

	logic N, Z, C, V, GE;


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
			default: CondEx = 1'b1; // undefined
		endcase
endmodule




//module Condcheck(input logic [3:0] Cond, Flags, 
//						output logic CondEx);
//
//
//	logic C,N,V,Z;
//	
//	assign N = Flags[3];
//	assign Z = Flags[2];
//	assign C = Flags[1];
//	assign V = Flags[0];
//	
//	logic EQ,NE,CS,CC,MI,PL,VS,VC,HI,LS,GE,LT,GT,LE,AL;
//	
//	assign EQ = Z;
//	assign NE = ~Z;
//	assign CS = C;
//	assign CC = ~C;
//	assign MI = N;
//	assign PL = ~N;
//	assign VS = V;
//	assign VC = ~V;
//	assign HI = NE & CS;
//	assign LS = EQ | CC;
//	assign GE = ~LT;
//	assign LT = N^V;
//	assign GT = GE & NE;
//	assign LE = ~GT;
//	assign AL = 1;
//	
//	/*
//	module MUX #(parameter N=32) (
//	input [N-1:0] a, b, c, d, e, f,g, h,i, j,k, l, m, n, o, p, 
//	input [3:0] selection_i, 
//	output [N-1:0] result);
//	*/
//
//	MUX #(1) _flagselector(EQ,NE,CS,CC,MI,PL,VS,VC,HI,LS,GE,LT,GT,LE,AL,AL,Cond,CondEx);
//
//
//endmodule
