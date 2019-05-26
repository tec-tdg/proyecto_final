module Debounce (input logic bouncing_signal, input logic clk, output logic debounced_signal);


	logic delay_1, delay_2, delay_3;
	
	
	logic reset;
	assign reset = 0;
	
	/**
		Firma del módulo
	
					  input  logic dataIn, 
					  input  logic clk, 
					  input  logic reset, 
					  output logic dataOut);
	*/
	FlipFlop f1(bouncing_signal,clk,reset,delay_1);
	
	FlipFlop f2(delay_1,clk,reset,delay_2);
	
	FlipFlop f3(delay_2,clk,reset,delay_3);
	
	assign debounced_signal = delay_1 & delay_2 & delay_3;


endmodule
