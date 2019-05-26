//Este procesador interpreta un ADD y  un ADD con inmediato

//Se recibe un PC y se vera si el procesador guardo en memoria los valos 
//de los registros ya sumados por el ALU
module CPU_V1(logic input [31:0] PC_test,logic input clk_test, reset_test,logic output [31:0] Memory_Stored);

//Se  conecta la entrada PC_Test a un program counter

//Program_Counter (clk_input, reset_input,pc_prima_input,pc_output);

Program_Counter PROGRAM_COUNTER(clk_test,reset_test,PC_test,PC_Test_Output);

//Se crea el output del Program_Counter y se conecta a la siguiente etapa 

logic [31:0] PC_Test_Output;

// La siguiente estapa es el instruction memory
// module InstructionMemory (input logic [bus-1:0] address, input logic clk, reset, output logic [bus-1:0] data);

InstructionMemory INSTRUCTIONMEMORY(PC_Test_Output,clk_test,reset_test,);


endmodule