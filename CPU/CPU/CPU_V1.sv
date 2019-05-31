//Este procesador interpreta un ADD y  un ADD con inmediato

//Se recibe un PC y se verá si el procesador guardó en memoria los valores
//de los registros ya sumados por el ALU
module CPU_V1(  input logic  [31:0] pc,
					 input logic clk, reset,
					 output logic [31:0] output_cpu);

//Se  conecta la entrada PC a un program counter

//Program_Counter (clk_input, reset_input,pc_prima_input,pc_output);

Program_Counter(clk,reset,pc,PC_Out);

//Se crea el output del Program_Counter y se conecta a la siguiente etapa 

logic [31:0] PC_Out;

// La siguiente estapa es el instruction memory
// module InstructionMemory (input logic [bus-1:0] address, input logic clk, reset, output logic [bus-1:0] data);

//
InstructionMemory(PC_Out,clk,reset,instruction);

// Se crea la salida del Instruction Memory

logic [31:0] instruction;

/*
REGISTER_FILE#(parameter N = 4,parameter M = 32)
				(  input logic   clk,
					input logic   WE3,
					
					input logic   [N-1:0]  A1,
					input logic   [N-1:0]  A2,
					input logic   [N-1:0]  A3,
					
					input logic   [M-1:0]  WD3,
					
					input logic   [M-1:0]  R15,
					
					
					output logic  [M-1:0] RD1,
					output logic  [M-1:0] RD2);
*/
logic we3;
assign we3 = 1;// Habilitar escritura
REGISTER_FILE( clk,
					we3,
					instruction[19:16],
					4'bzzzz,
					instruction[15:12],
					read_data_WD3, //395
					32'bz,
					rd1_SrcA,
					rd2_writeData); // páginas 393


logic [31:0] read_data_WD3; // dato que se lee 					
logic [31:0] rd1_SrcA; // salida del RD1
logic [31:0] rd2_writeData; //



logic [3:0] alu_control;

assign alu_control = 4'b0000;

//Se instancia la logica de salida y de flags

//logic[31:0] alu_result;
logic[3:0] Alu_flags;
/*
module ALU #(parameter N=1) (
	input [N-1:0] a_i, b_i,
	input [3:0] alucontrol,
	output [N-1:0] result,//To display 7-segments
	output [3:0] output_flags);
**/
ALU#32(  rd1_SrcA,
			32'b0,
			alu_control,
			output_cpu, // por ahora vamos asignar este data para pruebas
			Alu_flags);

			


endmodule