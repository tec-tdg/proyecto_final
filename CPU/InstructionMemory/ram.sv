//Tomado del libro HDL Example 7.14
module ram#(parameter M = 32)
				(  input logic   clk, we,
					input logic   [M-1:0] a,wd,
					output logic  [M-1:0] rd);
				
		logic [M-1:0] RAM[2*M-1:0];
		assign rd = RAM[a[31:2]]; // word aligned
			
		always_ff @(posedge clk)
			if (we) RAM[a[31:2]] <= wd;
endmodule
