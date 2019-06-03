//Tomado del libro HDL Example 5.6 RAM

//Evoluciona a 387 del libro de texto
module REGISTER #(parameter M = 32)
				(  input logic   clk,reset,
					input logic   WE,
					input logic [M-1:0] DATA_IN,
					output reg  [M-1:0] RD
					);
				
		logic [M-1:0] mem;
		
		always_ff @(posedge clk)
		begin
		  
		   if (reset) mem <= 32'b0;
			if (WE) mem  <= DATA_IN; //Escritura habilitada de forma sincrónica
			

		
		 end
		 
		 	assign RD = mem;//La lectura simepre ocurre de forma inmediata
	
		
endmodule
