module notGate #(parameter N=1) (
	input [N-1:0] operandA,
	output [N-1:0] result);
	
	assign result = ~operandA;
	
endmodule
