//Este procesador interpreta un ADD y  un ADD con inmediato

//Se recibe un PC y se verá si el procesador guardó en memoria los valores
//de los registros ya sumados por el ALU
module CPU_V1(  input logic  [31:0] pc,
					 input logic clk, reset,
					 output logic [31:0] output_cpu,
					 output logic [31:0] instruction,PC_Out);

//Se  conecta la entrada PC a un program counter

//Program_Counter (clk_input, reset_input,pc_prima_input,pc_output);


Program_Counter  pc_module(clk,reset,pc,PC_Out);

//Se crea el output del Program_Counter y se conecta a la siguiente etapa 



// La siguiente estapa es el instruction memory
// module InstructionMemory (input logic [bus-1:0] address, input logic clk, reset, output logic [bus-1:0] data);

// Se crea la salida del Instruction Memory

//logic [31:0] instruction;

InstructionMemory im_module(PC_Out,clk,reset,instruction);



/*REGISTER_FILE#(parameter N = 4,parameter M = 32)
				(  input logic   clk,
					input logic   WE3,
					
					input reg   [N-1:0]  A1,
					input reg   [N-1:0]  A2,
					input reg   [N-1:0]  A3,
					
					input logic   [M-1:0]  WD3,
					
					input logic   [M-1:0]  R15,
					
					
					output reg  [M-1:0] RD1,
					output reg  [M-1:0] RD2);*/



logic [31:0] read_data_WD3; // dato que se lee 					
//logic [31:0] rd1_SrcA; // salida del RD1

logic [31:0] r15;

logic [31:0] rd2_writeData; //salida RD2
logic we3;
assign we3 = 0;// Habilitar escritura


/*module REGISTER_FILE_STRUCTURAL #(parameter N = 4,parameter M = 32)
				(  input logic   clk,reset,
					input logic   WE3,
					
					input reg   [N-1:0]  A1,
					input reg   [N-1:0]  A2,
					input reg   [N-1:0]  A3,
					
					input logic   [M-1:0]  WD3,
					
					input logic   [M-1:0]  R15,
					
					
					output reg  [M-1:0] RD1,
					output reg  [M-1:0] RD2);
*/

REGISTER_FILE_STRUCTURAL rf_module( 
					clk,              //input logic   clk,
					reset,            //reset of
					we3,                      //input logic   WE3,
					instruction[19:16],       //input logic   [N-1:0]  A1,
					4'bzzzz,                  //input logic   [N-1:0]  A2,
					instruction[15:12],       //input logic   [N-1:0]  A3,
					
					read_data_WD3,            //write data 3
					r15,							  //input logic   [M-1:0]  R15, página 395,
					output_cpu,					  //output logic  [M-1:0]  RD1,
					rd2_writeData);			  //output logic  [M-1:0]  RD2
					
					           // páginas 393



//
//logic [3:0] alu_control;
//
//assign alu_control = 4'b0000;
//
////Se instancia la logica de salida y de flags
//
//logic[31:0] alu_result;
//logic[3:0] Alu_flags;
///*
//module ALU #(parameter N=1) (
//	input [N-1:0] a_i, b_i,
//	input [3:0] alucontrol,
//	output [N-1:0] result,//To display 7-segments
//	output [3:0] output_flags);
//**/
//ALU#32 alu_module(  
//			rd1_SrcA,
//			32'b0,
//			alu_control,
//			output_cpu, // por ahora vamos asignar este data para pruebas
//			Alu_flags);

			
			
			


endmodule