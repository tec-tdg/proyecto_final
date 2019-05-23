// Este test inicializa un ram la cual carga los datos del archivo.


module readmemh_tb();
    reg [31:0] test_memory [0:15];// 16 palabras de 32 bits
	 
	 integer index;
    
	 
	 
	 logic   in_dut_clk;
	 logic   in_dut_we;
	 logic   [15:0] in_dut_adr;
	 logic   [31:0] in_dut_din;
	 logic   [31:0] out_dut_dout;
	 
	 
	 
	 ram dut(in_dut_clk,in_dut_we,in_dut_adr,in_dut_din,out_dut_dout);
	 
	 integer i;
	 
	 
	 initial begin
		  i = 0;
		  in_dut_we = 1;
	     in_dut_adr = 15'b0000_0000_0000_0000;
        $display("Loading rom.");
        $readmemh("test.txt", test_memory);
    end
	 
	 
	 
	 always @(negedge in_dut_clk) begin 
			in_dut_din = test_memory[i];
			//incrementar index 
			i = i +1;
			//inclementar address
			in_dut_adr = in_dut_adr + 1;
	 end
	 
endmodule
