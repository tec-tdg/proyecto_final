module shiftreg #(parameter N = 11)
	(input logic clk,
	 input logic reset,
	 input logic sin,
	 output logic [N-1:0] q,
	 output logic sout);
	 

	 always_ff @(posedge clk,posedge reset)
		if(reset) q <= 0;
		else q <= {q[N-2:0],sin};
		
	
	 assign sout = q[N-1];
		
		
	
endmodule
	
	 