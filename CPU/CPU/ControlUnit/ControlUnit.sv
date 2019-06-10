module ControlUnit (input logic clk, reset,
						  input logic [31:12] Instr,
						  input logic [3:0] ALUFlags,
						  output logic [1:0] RegSrc,
						  output logic RegWrite,
						  output logic [1:0] ImmSrc,
						  output logic ALUSrc,
						  output logic [1:0] ALUControl,
						  output logic MemWrite,MemtoReg,
						  output logic PCSrc	
						  );

	logic [1:0] FlagW;
	logic PCS, RegW, MemW, NoWrite;
	

/*
	module CUDecoder (input logic [1:0] Op,
					 input logic [5:0] Funct,
					 input logic [3:0] Rd,
					 output logic [1:0] FlagW,
					 output logic PCS,
					 output logic RegW,
					 output logic MemW,
					 output logic MemtoReg, ALUSrc, 
					 output logic [1:0] ImmSrc,
					 output logic [1:0] RegSrc,
					 output logic [1:0] ALUControl,
					 output logic NoWrite
					 );*/


	CUDecoder dec(Instr[27:26], Instr[25:20], Instr[15:12], 
		FlagW, PCS, RegW, MemW,
		MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite);


/*module Condlogic(input logic clk, reset,
					  input logic [3:0] Cond,
					  input logic [3:0] ALUFlags,
					  input logic [1:0] FlagW,
					  input logic PCS,
					  input logic RegW,
					  input logic MemW,
					  input logic NoWrite,
					  output logic PCSrc, 
					  output logic RegWrite, 
					  output logic MemWrite);*/

Condlogic condo(clk, reset, Instr[31:28], ALUFlags,
 FlagW, PCS, RegW, MemW, NoWrite, 
 PCSrc, RegWrite, MemWrite);		  

endmodule
