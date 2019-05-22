//Tomado del libro HDL Example 5.6 RAM
module ram#(parameter N = 6,parameter M = 32)
				(  input logic   clk,
					input logic   we,
					input logic   [N-1:0] adr,
					input logic   [M-1:0] din,
					output logic  [M-1:0] dout);
				
		logic [M-1:0] mem [2**N-1:0];// 2**N palabras de M bits
		
		always_ff @(posedge clk)
			if (we) mem [adr] <= din; //Escritura habilitada de forma sincrónica
			
		assign dout = mem[adr];//La lectura simepre ocurre de forma inmediata-
		
endmodule