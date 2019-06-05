module REGISTER_tb();

	/*
	module REGISTER #(parameter M = 32)
				(  input logic   clk,reset,
					input logic   WE,
					input logic [M-1:0] DATA_IN,
					output reg  [M-1:0] RD
					);*/
					
	logic clk_in,reset_in,WE_in;
	logic [31:0] data;
	logic [31:0] rd;
	
	REGISTER dut(clk_in,reset_in,WE_in,data,rd);
	
	
	initial begin 
		assign WE_in = 0;
		assign reset_in = 1;
		
		#100
		assign reset_in = 0;
	end
	
	always_ff @(posedge clk_in) begin 
		$display( "Data %h , RD  %h",data,rd);
	end
	
endmodule
