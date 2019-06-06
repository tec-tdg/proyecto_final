/*Módulo top para probar el ORR*/

module TOP_V0(input logic clk, reset,
				  output logic [31:0] WriteData, DataAdr,
              output logic MemWrite);

				  
logic [31:0] PC, Instr, ReadData;



// Se instancia el procesador y las memorias

/*

ARM_V0(input logic clk, reset,
output logic [31:0] PC,
input logic [31:0] Instr,
output logic MemWrite,
output logic [31:0] ALUResult, WriteData,
input logic [31:0] ReadData);			  

*/

ARM_V0 arm(clk, reset, PC, Instr, MemWrite, DataAdr,WriteData, ReadData);
/*
module InstructionMemory #(parameter bus=32, parameter memorySize = 1024*4, parameter inputFile="instructions.txt")
	(input logic [bus-1:0] address, input logic clk, reset, output logic [bus-1:0] data);
*/

//Chequear que tan conveniente es resetear la memoria.

InstructionMemory imem(PC,clk,reset,Instr);

/*

module ram#(parameter M = 32)
				(  input logic   clk, we,
					input logic   [N-1:0] a,wd
					output logic  [M-1:0] rd);

*/

ram dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
endmodule 