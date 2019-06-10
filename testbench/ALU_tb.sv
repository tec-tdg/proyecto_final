module ALU_tb();

	/**
		
	module ALU #(parameter N=1) (
	input [N-1:0] a_i, b_i,
	input [3:0] alucontrol,
	output [N-1:0] result,//To display 7-segments
	output [3:0] output_flags);
		
	*/
	logic [31:0] operandA,operandB;
	logic [3:0]  control;
	logic [31:0] result;
	logic [3:0]  output_flags;
	
	
	ALU#32 dut(operandA,operandB,control,result,output_flags);
	
	initial begin
		assign control = 4'b0000; // ADD
		assign operandA = 32'b0000_0000_0000_0000_1111_0000_1100_0000;
		assign operandB = 32'b0000_0000_1111_0000_0000_0011_0000_1000;
		#50
		assert( result == 32'b0000_0000_1111_0000_1111_0011_1100_1000) $display ("RESULT ADD OK"); else $error("RESULT ADD failed");
		assert( output_flags == 4'b0000)$display ("RESULT ADD/flags OK"); else $error("RESULT ADD/flags failed");
		
		#50		
		assign control = 4'b0001; // SUB
		assign operandA = 32'b0000_0000_0000_0000_0000_0000_0000_1111;
		assign operandB = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
		#50
		assert( result == 32'b0000_0000_0000_0000_0000_0000_0000_1110)	$display ("RESULT SUB OK"); else $error("RESULT SUB failed");
		assert( output_flags == 4'b0000)$display ("RESULT SUB/flags OK"); else $error("RESULT SUB/flags failed");
		
		
		#50
		assign control = 4'b0010; // AND
		assign operandA = 32'b0000_1111_0000_1001_0000_0000_0000_1111;
		assign operandB = 32'b0000_1111_0000_1111_0000_0000_0000_0000;
		#50
		assert( result == 32'b0000_1111_0000_1001_0000_0000_0000_0000) $display ("RESULT AND OK"); else $error("RESULT AND failed");
		assert( output_flags == 4'b0000)$display ("RESULT AND/flags OK"); else $error("RESULT AND/flags failed");	
		
		
	
		#50
		assign control = 4'b0011; // OR
		assign operandA = 32'b0000_1111_0000_1001_0000_0000_0000_1111;
		assign operandB = 32'b0000_1111_0000_1111_0000_0000_0000_0000;
		#50
		assert( result == 32'b0000_1111_0000_1111_0000_0000_0000_1111)	$display ("RESULT OR OK"); else $error("RESULT OR failed");
		assert( output_flags == 4'b0000)$display ("RESULT OR/flags OK"); else $error("RESULT OR/flags failed");	
		
		
	
	end
	
endmodule
