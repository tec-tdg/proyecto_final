/*Módulo top para probar el ORR*/

module TOP_V1(input logic clk, reset,ps2dd, ps2cc,
				  input logic [7:0] intiles,
				  output logic [7:0] rx_dataa,
              output logic  hsync_outt, vsync_outt, sync_b_outt, blank_b_outt,clk_outt,
				  output logic [7:0] redd,greenn,bluee);

				  
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
logic[31:0] WriteData;
logic[31:0] DataAdr;
logic MemWrite;
ARM_V0 arm(clk, reset, PC, Instr, MemWrite, DataAdr,WriteData, ReadData);
/*
module InstructionMemory #(parameter bus=32, parameter memorySize = 1024*4, parameter inputFile="instructions.txt")
	(input logic [bus-1:0] address, input logic clk, reset, output logic [bus-1:0] data);
*/

//Chequear que tan conveniente es resetear la memoria.

InstructionMemory imem(PC,Instr);

/*

module ram#(parameter M = 32)
				(  input logic   clk, we,
					input logic   [M-1:0] a,wd,
					input logic   [M-1:0] wdPS2,
					output logic  [M-1:0] rd,
					output logic  [M-1:0] rdVGA);

*/
logic [31:0] forPS2,forVGA;
assign forPS2 ={ 32'b0};
//assign forPS2 ={ 23'b0,1'b1,intiles};
ram dmem(clk, MemWrite, DataAdr, WriteData,forPS2, ReadData,forVGA);



/*module VGA (input logic clk,
				input logic [12:0] tiles,
				output logic hsync_out, vsync_out, sync_b_out, blank_b_out,clk_out,
				output logic [7:0] red,green,blue);*/
VGA screen(clk,forVGA[12:0],hsync_outt, vsync_outt, sync_b_outt, blank_b_outt,clk_outt,redd,greenn,bluee);

/**
module ps2
	(
		input logic clk, reset, 
		input logic ps2d, ps2c, rx_en,    // ps2 data and clock inputs, receive enable input
		output logic rx_done_tick,         // ps2 receive done tick
		output logic [7:0] rx_data,
      output logic status		// data received 
	);
*/
logic rx_done_tickk;
//logic statuss;
ps2 piano(clk,1'b0,ps2dd, ps2cc, 1'b1,rx_dataa);

endmodule 