module CPU_V0(
					 input logic  [31:0] pc,
					 input logic clk, reset,
					 output logic [31:0] output_cpu,
					 output logic [31:0] instruction);
					 
					 
//Se  conecta la entrada PC a un program counter

//Program_Counter (clk_input, reset_input,pc_prima_input,pc_output);

logic [31:0] PC_Out;
Program_Counter  pc_module(clk,reset,pc,PC_Out);

//Se crea el output del Program_Counter y se conecta a la siguiente etapa 



// La siguiente estapa es el instruction memory
// module InstructionMemory (input logic [bus-1:0] address, input logic clk, reset, output logic [bus-1:0] data);

// Se crea la salida del Instruction Memory

//logic [31:0] instruction;

InstructionMemory im_module(PC_Out,clk,reset,instruction);


endmodule



