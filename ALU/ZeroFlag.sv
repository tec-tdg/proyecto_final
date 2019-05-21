module ZeroFlag  #(parameter N=1)( 
	input [N-1:0] result, 
	output flag );
	
	logic [N-1:0]anti_result ;

	
	notGate#N ngate(result,anti_result);
	assign flag = &anti_result;



endmodule
