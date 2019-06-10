module MEMORYMAP_tb ();



/*
MEMORYMAP(        input logic clk,reset,
						input logic  [6:0] dir,
						input logic  [31:0] dataWrite,
					   input logic  WE,
					   input logic  [31:0] dataForPS2,
						output logic [31:0] readData,					   
					   output logic [31:0] dataForVGA);
						
*/
logic clk,reset;
logic [5:0] dir;
logic [31:0] dataWrite;
logic WE;
logic [31:0] dataForPS2;
logic [31:0] readData;				   
logic [31:0] dataForVGA;

MEMORYMAP dut(clk,reset,dir,dataWrite,WE,dataForPS2,readData,dataForVGA);


	initial begin
		assign reset = 0;
		#10
		assign reset = 1;
		#50
		assign reset = 0;
		
		
		assign dir = 5'b000_001; // R1 escria dataWrite
		assign WE =1;
		assign dataWrite = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
		#50
		assert(readData == 32'b1111_1111_1111_1111_1111_1111_1111_0000) $display("ok"); else $error("Falla");
		#110
		assign WE = 0; //Escritura libre para PS2,
		assign dir = 6'b111_110;
		assign dataForPS2 = 32'b1111_1111_1010_1111_1010_1111_1111_0000;
		#110
		assert(readData == 32'b1111_1111_1010_1111_1010_1111_1111_0000) $display("ok 2"); else $error("Falla 2");
	end
endmodule
