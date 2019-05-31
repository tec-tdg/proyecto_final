module InstructionMemory #(parameter bus=32, parameter memorySize = 1024*4, parameter inputFile="instructions.txt")
	(input logic [bus-1:0] address, input logic clk, reset, output logic [bus-1:0] data);

	logic [bus-1:0] memory_array [0:memorySize-1];
	
	initial begin 
		$readmemh(inputFile,memory_array);
	end
	
	always @(negedge clk) begin 
		//data <= memory_array[{2'b00,address[bus-1:2]}]; 
		data <= memory_array[address]; // para propósitos de prueba
	end
	
endmodule
