/*
Es un pc_prima que será el nuevo cada ciclo de reloj.
Posee un reset asincrónico (no importa el estado de las entradas) que actua en el ciclo positivo.
*/

module Program_Counter( input  logic clk, 
								input  logic reset,
								input  logic [31:0] pc_prima, 
								output logic [31:0] pc);
		
		always @(negedge clk, posedge reset) begin 
			if(reset) pc = 32'b0;
			else pc <= pc_prima;
		end

endmodule
