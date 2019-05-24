module Program_Counter_tb ();
	logic [31:0] pc_prima_input;
	logic clk_input;
	logic  reset_input;
	logic [31:0] pc_output;
	Program_Counter dut(clk_input, reset_input,pc_prima_input,pc_output);

  
	
	initial begin 
		reset_input = 0;
		pc_prima_input = 32'b0000_1111_0000_1111;
		#100 // como es negedge el dato estará listo hasta el flanco negativo en el primar cilo del relog
		assert(pc_output === 32'b0000_1111_0000_1111) $display("pc ok 0x0F0F ");
		pc_prima_input = 32'hECAB;
		#100
		assert(pc_output === 32'hECAB) $display("pc ok 0xECAB");
	end
endmodule