module Vflag#(parameter N=1)( 
	input [N-1:0] a_i,b_i, result,
	input [3:0] alucontrol,
	output flag );
	
	logic msb_a;
	logic msb_b;
	logic msb_result;
	
	logic alu_0;
	logic alu_1;
	
	assign msb_a = a_i[N-1];
	assign msb_b = b_i[N-1];
	assign msb_result = result[N-1];
	
	assign alu_0 = alucontrol[0];
	assign alu_1 = alucontrol[1];
	
	
	assign flag = !(msb_a ^ msb_b ^ alu_0  ) & (msb_result ^ msb_a) & (!alu_1);
	
	
	
endmodule
