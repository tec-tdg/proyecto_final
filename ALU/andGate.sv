module andGate #(parameter N=1)(
	input[N-1:0] operandA, operandB,
	output[N-1:0] result);
	
	assign result = operandA & operandB;
	
endmodule
		