module Instruction_tb();
	/**
	module InstructionMemory #(parameter bus=32, parameter memorySize = 1024*4, parameter inputFile="instructions.txt")
	(input logic [bus-1:0] address, 
	 input logic clk, reset, output logic [bus-1:0] data);

	**/
	
	logic [31:0] address_input ;
	logic [31:0] data_output ;
	logic clk,reset;
	InstructionMemory  dut(address_input,clk,reset,data_output);
	
	initial begin
		assign reset = 0;
		assign address_input = 32'b0;
	
	end
	
	 always @(posedge clk) begin 
			assign  address_input = address_input + 1 ;
			$display("PC: %d  instruction %h",address_input,data_output);
	 end
	
endmodule
