module Condlogic(input logic clk, reset,
					  input logic [3:0] Cond,
					  input logic [3:0] ALUFlags,
					  input logic [1:0] FlagW,
					  input logic PCS,
					  input logic RegW,
					  input logic MemW,
					  output logic PCSrc, 
					  output logic RegWrite, 
					  output logic MemWrite);

	logic [1:0] FlagWrite;
	logic [3:0] Flags;
	logic CondEx;

	FlipFlopen #(2)flagflop1(clk, reset, FlagWrite[1], ALUFlags[3:2], Flags[3:2]);

	FlipFlopen #(2)flagflop2(clk, reset, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);

	// write controls are conditional
	Condcheck cc(Cond, Flags, CondEx);
	
	// Logic gates assigment
	assign FlagWrite = FlagW & {2{CondEx}};
	assign RegWrite = RegW & CondEx;
	assign MemWrite = MemW & CondEx;
	assign PCSrc = PCS & CondEx;
endmodule
