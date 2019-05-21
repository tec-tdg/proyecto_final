module ALU #(parameter N=1) (
	input [N-1:0] a_i, b_i,
	input [3:0] alucontrol,
	output [N-1:0] result,//To display 7-segments
	output [3:0] output_flags);
	
	logic Ne,V,C,Z;
	
	
	assign output_flags[3]  = C;
	assign output_flags[2]  = Ne;
	assign output_flags[1]  = V;
	assign output_flags[0]  = Z;
	
	//OR con salida que entra XOR que tambien recibe B
	
	
	logic [N-1:0] b_i_prima;
	Binterface#N binterface(b_i,alucontrol,b_i_prima);
	
	logic bussize[N-1:0];
	
	logic[N-1:0] 
	function0, /*Adder*/
	
	function2, /*AND*/
	function3, /*OR*/
	function4, /*NOT*/
	function5, /*XOR*/
	function6, /*LOGIC LEFT SHIFT*/
	function7, /*Arithmetic LEFT SHIFT*/
	function8, /*Logic Right SHIFT*/
	function9, /*Arithmetic Right SHIFT*/
	function10,function11, function12,function13,function14,function15;
	
	
	//Load Adder
	//logic c_in_initial = 1'b0;
	logic carryinitial;
	assign carryinitial = 1'b0;
	Fulladder#N adder(a_i,b_i_prima,carryinitial,function0,C);
	
	//Load Substraction
	
	//Load AND
	andGate#N andmodule(a_i,b_i,function2);
	
	//Load OR
	orGate#N ormodule(a_i,b_i,function3);
	
	//Load NOT
	notGate#N notmodule(a_i,function4);
	
	
	//Load XOR
	xorGate#N xormodule(a_i,b_i,function5);
	
	//Load ShiftLeft Logic
	shiftLeftLog#N shiftleftlogmodule(a_i,b_i,function6);
	
	//Load ShiftLeft Arithmetic
	shiftLeftArit#N shiftleftaritmodule(a_i,b_i,function7);
	
	//Load ShiftRight Logic
	shiftRightLog#N shiftrightlogmodule(a_i,b_i,function8);
	
	
	//Load ShiftRight Arithmetic
	shiftRightArit#N shiftrightaritmodule(a_i,b_i,function9);
	
	//multiplexer mux();
	multiplexer#N muxmodule(function0,function0,function2,
	function3,function4,function5,function6,function7,
	function8,function9,function10,function11,function12,
	function13,function14,function15,alucontrol,result);
	
	
	ZeroFlag#N dut(result,Z);
	assign Ne = result[N-1];
	Vflag#N vflag(a_i,b_i,result,alucontrol,V);

	
	
	
	
	

endmodule
