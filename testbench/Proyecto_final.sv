module shiftregister_tb();


 /**
 module shiftreg #(parameter N = 8)
	(input logic clk,
	 input logic reset ,load,
	 input logic sin,
	 input logic [N-1:0] d,
	 output logic [N-1:0] q,
	 output logic sout);
 */
  logic clk,reset,load,sin,sout;
  logic [7:0] data,query;
  
  shiftreg(clk,reset,load,sin,data,query,sout);
 
  initial begin
	assign reset = 0;
	assign load = 1;
	assign sin = 1;
  
  end
 
  always_ff @(posedge clk) 
	sin = clk;
  end
  
  
endmodule
