module CPU_V1_tb();

	/*
	module CPU_V1(  input logic  [31:0] pc,
					 input logic clk, reset,
					 output logic [31:0] memory_stored);*/
					 
				 
  logic  [31:0] pc_in;
  logic clk_in,reset_in;
  logic [31:0] result_out;
   logic [31:0] instruction_out,pc_out;
  
  CPU_V1 dut( pc_in,
				  clk_in, 
				  reset_in,
				  result_out,
				  instruction_out,
				  pc_out);
				  
	initial begin 
		assign pc_in = 32'b0;
		assign reset_in = 0;	
	
	end
	 always @(negedge clk_in) begin 
			assign pc_in = pc_in + 4 ;
			assign reset_in = 0;	
	 end
					 
  

endmodule
