module FlipFlop (input  logic dataIn, 
					  input  logic clk, 
					  input  logic reset, 
					  output logic dataOut);

	always @(posedge clk, posedge reset) begin 
		if(reset) dataOut <= 0;
		else dataOut <= dataIn;
	end					  
endmodule
