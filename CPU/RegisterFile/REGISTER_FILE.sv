//Tomado del libro HDL Example 5.6 RAM

//Evoluciona a 387 del libro de texto
module REGISTER_FILE#(parameter N = 4,parameter M = 32)
				(  input logic   clk,
					input logic   WE3,
					
					input logic   [N-1:0]  A1,
					input logic   [N-1:0]  A2,
					input logic   [N-1:0]  A3,
					
					input logic   [M-1:0]  WD3,
					
					input logic   [M-1:0]  R15,
					
					
					output logic  [M-1:0] RD1,
					output logic  [M-1:0] RD2);
				
		logic [M-1:0] mem [2**N-1:0];// 2**N palabras de M bits
		
		always_ff @(posedge clk)
			if (WE3) mem [A3] <= WD3; //Escritura habilitada de forma sincrónica
			
		assign RD1 = mem[A1];//La lectura simepre ocurre de forma inmediata
		assign RD2 = men[A2];//La lectura simepre ocurre de forma inmediata
		
endmodule