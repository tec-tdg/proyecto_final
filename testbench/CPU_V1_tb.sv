module CPU_V1_tb();

	/*
	module CPU_V1(  input logic  [31:0] pc,
					 input logic clk, reset,
					 output logic [31:0] memory_stored);*/
					 
					 
  logic  [31:0] pc;
  logic clk,reset;
  logic [31:0] result;
  
  
  CPU_V1 dut( pc,
				  clk, 
				  reset,
				  result);
				  
	initial begin 
		assign pc = 4'b0;
		assign reset = 0;
		
		
	end
					 
  

endmodule