module readmemh_tb();
    reg [7:0] test_memory [0:15];
	 
	 integer index;
    initial begin
        $display("Loading rom.");
        $readmemh("test.txt", test_memory);
    end
	 
	 initial begin 
		for (index= 0; index < 16; index++) $display("%d:%h",index,test_memory[index]);
			
	 end
endmodule
