module REGISTER_FILE_STRUCTURAL_tb();
	
	/*
	 REGISTER_FILE#(parameter N = 4,parameter M = 32)
				(  input logic   clk,
					input logic   WE3,
					
					input reg   [N-1:0]  A1,
					input reg   [N-1:0]  A2,
					input reg   [N-1:0]  A3,
					
					input logic   [M-1:0]  WD3,
					
					input logic   [M-1:0]  R15,
					
					
					output reg  [M-1:0] RD1,
					output reg  [M-1:0] RD2);
	*/
	logic   clk_in;
	logic   WE3_in;
	logic   reset;
				
	logic   [3:0]  A1_in;
	logic   [3:0]  A2_in;
	logic   [3:0]  A3_in;

	logic   [31:0]  WD3_in;

	logic   [31:0]  R15_in;


	logic  [31:0] RD1_out;
	logic  [31:0] RD2_out;
	
	
	REGISTER_FILE_STRUCTURAL dut(clk_in,WE3_in,reset,A1_in,A2_in,A3_in,WD3_in,R15_in,RD1_out,RD2_out);
	
	initial begin
		assign WE3_in = 0;
		assign reset = 0;
		assign A1_in = 4'b0000;
		assign A2_in = 4'b0000;
		assign A3_in = 4'b0000;
		assign WD3_in = 32'b0;
		assign R15_in = 32'b0;
//		#5;
//		assign WE3_in =1;
//		
//		assign A3_in = 4'b0000;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
//		#5;
//		assign A3_in = 4'b0001;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
//		#5
//		assign A3_in = 4'b0010;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
//		#5
//		assign A3_in = 4'b0011;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_0011;
//		#5
//		assign A3_in = 4'b0100;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_0100;
//		#5;
//		assign A3_in = 4'b0101;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_0101;
//		#5
//		assign A3_in = 4'b0101;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_0110;
//		#5
//		assign A3_in = 4'b0110;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_0111;
//		#5
//		assign A3_in = 4'b0111;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
//		#5;
//		assign A3_in = 4'b1000;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_1001;
//		#5
//		assign A3_in = 4'b1001;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_1010;
//		#5
//		assign A3_in = 4'b1010;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_1011;
//		#5
//		assign A3_in = 4'b1011;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_1100;
//		#5;
//		assign A3_in = 4'b1100;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_1101;
//		#5
//		assign A3_in = 4'b1101;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_1110;
//		#5
//		assign A3_in = 4'b1110;
//		assign WD3_in = 32'b0000_0000_0000_0000_0000_0000_0000_1111;
		
		assign reset = 1;
		#200
		assign reset =0;
	
		
		
	
	
	end
	
	always @(negedge clk_in) begin 
			assign A1_in = A1_in + 4'b0001;
			assign A2_in = A2_in + 4'b0001;
	 end


endmodule
