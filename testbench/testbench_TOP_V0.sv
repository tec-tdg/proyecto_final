module testbench_TOP_V0();
	logic clk;
	logic reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	// instantiate device to be tested
	TOP_V0 dut(clk, reset, WriteData, DataAdr, MemWrite);
	// initialize test
	initial
	begin
	reset <= 1; # 22; reset <= 0;
	end
	// generate clock to sequence tests
	always
	begin
	
	clk <= 1; # 5; clk <= 0; # 5;
	
	//Se chequea que 7 se escribio en la direccion 0x64
	//al final del programa
	end
	always@(negedge clk)
	begin
		if(MemWrite) begin 
			if(DataAdr === 100 & WriteData === 7)begin
			$display("Simulacion correcta");
			$stop;
		end else if(DataAdr !== 96) begin
			$display ("Simulacion fallo");
         $stop;
		end
	end
   end	
endmodule
