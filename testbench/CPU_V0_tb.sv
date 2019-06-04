module CPU_V0_tb();

	 logic  [31:0] pc_in;
					 
	 logic clk_in, reset_in;
	 
	 logic [31:0] output_cpu_out;
	 
	 logic [31:0] instruction_out;
	 
	 /*
	 
	 module CPU_v0(
					 input logic  [31:0] pc,
					 input logic clk, reset,
					 output logic [31:0] output_cpu,
					 output logic [31:0] instruction);*/
					 
	CPU_V0 dut(pc_in,clk_in,reset_in,output_cpu_out,instruction_out);
	
	initial begin
		assign reset_in = 0;
		assign pc_in = 32'b0;
	end
	
	always @(posedge clk_in) begin 
			assign  pc_in = pc_in + 1 ;
			$display("PC: %d  instruction %h",pc_in,instruction_out);
	 end
endmodule

