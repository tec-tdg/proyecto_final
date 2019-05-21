module OverflowFlag  #(parameter N=1)( 
	input [N-1:0] AluControl_in,Sum,a_i,b_i,
	output flag );
	
	//Xor 3 entradas negado
	
	logic [N-1:0]anti_xor1b ;
	logic [N-1:0]xor1a_out ;
	logic [N-1:0]xor1b_out ;

	
	xorGate#N Xor1a(a_i[N-1],b_i[0],xor1a_out);
	xorGate#N Xor1b(xor1a_out,AluControl_in[0],xor1b_out);
	notGate#N Xor1b_negated(xor1b_out,anti_xor1b);
	
	//Xor 2 entradas 
	
	logic [N-1:0]xor2_out;
	
	xorGate#N Xor2(a_i[N-1],Sum[N-1],xor2_out);
	
	//Not AluController
	logic not_out;
	
	notGate#N Not(AluControl_in[0],not_out);
	
	
	//AND 3 ENTRADAS
	
	logic [N-1:0]and1a_out ;
	logic [N-1:0]and1b_out ;

	
	
	andGate#N And1a(anti_xor1b,xor2_out,and1a_out);
	andGate#N And1b(and1a_out,not_out,and1b_out);
	
	
	
	//Se asigna overflow
	
	assign flag = &and1b_out;



endmodule
