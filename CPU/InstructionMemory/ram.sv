//Tomado del libro HDL Example 7.14
module ram#(parameter M = 32)
				(  input logic   clk, we,
					input logic   [M-1:0] a,wd,
					input logic   [M-1:0] wdPS2,
					output logic  [M-1:0] rd,
					output logic  [M-1:0] rdVGA);
				
		logic [M-1:0] RAM[2*M-1:0];
		assign rd = RAM[a[31:2]]; // word aligned
		
	
		
		always_ff @(posedge clk) begin
			RAM[32'b0000_0000_0000_0000_0000_0000_0011_1110] <= wdPS2;
			if (we) RAM[a[31:2]] <= wd;
		end
		//siempre lecturA
		assign rdVGA = RAM[32'b0000_0000_0000_0000_0000_0000_0011_1111]; //siempre lectura
	
		//siempre escritura
endmodule
