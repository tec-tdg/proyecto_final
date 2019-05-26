module Debounce_TB ();

	logic data_in;
	logic clk;
	logic data_out;
	
	Debounce dut(data_in,clk,data_out);
	
	initial begin 
		assign data_in = 1;
		#4
		assign data_in = 0;
		#2
		assign data_in = 1;
		#6
		assign data_in = 0;
		#2
		assign data_in = 1;
		#1
		assign data_in = 0;
		#8
		assign data_in = 1;
		#150
		assert(data_out == 1);
		#250
		assign data_in = 1;
		#4
		assign data_in = 0;
		#2
		assign data_in = 1;
		#6
		assign data_in = 0;
		#2
		assign data_in = 1;
		#1
		assign data_in = 0;
		#8
		assign data_in = 1;
		#100
		assert(data_out == 0);
		
	end
	
endmodule