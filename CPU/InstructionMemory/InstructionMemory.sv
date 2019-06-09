module InstructionMemory #(parameter bus=32,  parameter inputFile="instructions.txt")
	(input logic [bus-1:0] address, output logic [bus-1:0] data);

	logic [bus-1:0] memory_array [63:0];
	
	initial  
		$readmemh(inputFile,memory_array);
	
	
 
		assign data = memory_array[{2'b00,address[bus-1:2]}]; //se alinean las palabras
		
	
endmodule
