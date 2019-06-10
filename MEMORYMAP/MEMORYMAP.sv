module MEMORYMAP( input logic clk,reset,
						input logic  [5:0] dir,
						input logic  [31:0] dataWrite,
					   input logic  WE,
					   input logic  [31:0] dataForPS2,
						output logic [31:0] readData,					   
					   output logic [31:0] dataForVGA);
						
						
						
					logic [31:0] mem[63:0];

					always_ff @(negedge clk)begin 
						mem[6'b111_110] <= dataForPS2;//siempre escritura
						if (WE) mem[dir] <= dataWrite;
					end
					assign dataForVGA = mem[6'b111_111]; //siempre lectura
					assign readData = mem[dir]; //siempre lectura
															  
endmodule 
