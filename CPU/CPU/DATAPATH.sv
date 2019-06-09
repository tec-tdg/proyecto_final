//Este procesador interpreta un ORR utilizando banderas quemadas en el testbench
//que posteriormente vendran de la unidad de control


module DATAPATH(  input logic clk, reset,
					 input logic [1:0] RegSrc,
					 input logic RegWrite,
					 input logic [1:0] ImmSrc,
					 input logic ALUSrc,
					 input logic [1:0] ALUControl,
					 input logic MemtoReg,
                input logic PCSrc,
					 output logic [3:0] ALUFlags,
					 output logic [31:0] PC,
					 input logic [31:0] Instr,
					 output logic [31:0] ALUResult, WriteData,
					 input logic [31:0] ReadData
					 
						
				);


logic [31:0] PCNext, PCPlus4, PCPlus8;
logic [31:0] Result,ExtImm,SrcA,SrcB;
logic [3:0] RA1, RA2;

//Se crean los muxes que entran a PC 
MUX_2 #(32) pcmux(PCPlus4, Result, PCSrc, PCNext);
//Se conecta este mux con el modulo de PC
//Program_Counter (clk_input, reset_input,pc_prima_input,pc_output);


Program_Counter  pc_module(clk,reset, PCNext,PC);

//Se crea la suma de los PC 
/*module ADDER #(parameter WIDTH = 32)
		(input logic [WIDTH-1:0] a, b,
		 output logic [WIDTH-1:0] y);*/

ADDER_32 pc_add1(PC,32'b00000000000000000000000000000100,PCPlus4);
ADDER_32 pc_add2(PCPlus4,32'b00000000000000000000000000000100, PCPlus8);


//Se instancia los muxes de register file y el register file

/*module MUX_2 #(parameter N=4) (
	input [N-1:0] a, b, 
	input  selection_i, 
	output [N-1:0] result);*/

MUX_2 #(4) ra1mux(Instr[19:16], 4'b1111, RegSrc[0], RA1);
MUX_2 #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], RA2);

//Se instancia el Register file
/*

module REGISTER_FILE_STRUCTURAL #(parameter N = 4,parameter M = 32)
				(  input logic   clk,reset,
					input logic   WE3,
					input logic   [N-1:0]  A1,
					input logic   [N-1:0]  A2,
					input logic   [N-1:0]  A3,
					input logic   [M-1:0]  WD3,
					input logic   [M-1:0]  R15,
					output logic  [M-1:0] RD1,
					output logic  [M-1:0] RD2);


*/

/*Se testea con regfile del libro*/

REGISTER_FILE_STRUCTURAL registerfile(clk,reset,RegWrite,RA1,RA2,Instr[15:12],Result, PCPlus8,SrcA, WriteData);


//Se crea mux que está despues del Data memory

MUX_2 #(32) resmux(ALUResult,ReadData, MemtoReg, Result);

//se instancia le extend 

/*
module extend ( input logic [23:0] Instr,
					 input logic [1:0] ImmSrc,
					 output logic [31:0] ExtImm)

*/


extend ext(Instr[23:0], ImmSrc, ExtImm);

//Se hace la logica del ALU

	
//se crea el mux de ScrB

MUX_2 #(32) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);


/*
//Se instancia la ALU
ALU #(parameter N=1) (
	input [N-1:0] a_i, b_i,
	input [3:0] alucontrol,
	output [N-1:0] result,//To display 7-segments
	output [3:0] output_flags);

*/

ALU #(32) alu(SrcA, SrcB, {2'b00,ALUControl}, ALUResult, ALUFlags);
endmodule
