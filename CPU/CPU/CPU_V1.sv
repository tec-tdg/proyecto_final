//Este procesador interpreta un ADD y  un ADD con inmediato

//Se recibe un PC y se verá si el procesador guardó en memoria los valores
//de los registros ya sumados por el ALU
module CPU_V1( logic input [31:0] PC_test,
					logic input clk_test, reset_test,
					logic output [31:0] Memory_Stored);

//Se  conecta la entrada PC_Test a un program counter

//Program_Counter (clk_input, reset_input,pc_prima_input,pc_output);

Program_Counter PROGRAM_COUNTER(clk_test,reset_test,PC_test,PC_Test_Output);

//Se crea el output del Program_Counter y se conecta a la siguiente etapa 

logic [31:0] PC_Test_Output;

// La siguiente estapa es el instruction memory
// module InstructionMemory (input logic [bus-1:0] address, input logic clk, reset, output logic [bus-1:0] data);

//
InstructionMemory INSTRUCTIONMEMORY(PC_Test_Output,clk_test,reset_test,Data_out_test);

// Se crea la salida del Instruction Memory

logic [31:0] Data_out_test;

// Se pasara esa salida  19:16 se pasará como entrada al register file


//module ALU #(parameter N=1) (input [N-1:0] a_i, b_i,input [3:0] alucontrol, output [N-1:0] result,//To display 7-segmentsoutput [3:0] output_flags);

//Se quema valor a sumar el cual luego vendra ya sea de otro data_out o del extend

logic [31:0] Data_Test;

//Se le asigna valor a Data_Test

//PONER AQUI VALOR DE 32 BITS A SUMAR

//Se instancia el alucontrol para una suma 0000

logic [3:0] Alu_control_test;

assign Alu_control_test = 4'b0000;

//Se instancia la logica de salida y de flags

logic[31:0] Alu_output_test;
logic[3:0] Alu_flags_test;

ALU ALU #32(Data_out_test,Data_Test,Alu_control_test,Alu_output_test,Alu_flags_test);


endmodule