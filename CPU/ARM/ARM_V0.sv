/*Version del ARM que tendra los valores de control quemados
que son dados por la unidad de control para el datapath
para el chequeo  de un ORR
*/

module ARM_V0(input logic clk, reset,
				output logic [31:0] PC,
				input logic [31:0] Instr,
				output logic MemWrite,
				output logic [31:0] ALUResult, WriteData,
				input logic [31:0] ReadData
           );
			  
			  logic [3:0] ALUFlags;
			  logic RegWrite, ALUSrc, MemtoReg, PCSrc;
			  logic [1:0] RegSrc, ImmSrc, ALUControl;
			  
			  //se queman las señales estas las deberia dar la unidad de control
			  //para que se haga un ORR 
			  
	
			  assign PCSrc = 1'b0;
			  assign MemtoReg = 1'b0;
			  assign MemWrite = 1'b0;
			  assign ALUControl = 2'b11;
			  assign ALUSrc = 1'b0;
			  assign ImmSrc = 2'b00;
			  assign RegWrite = 1'b0;
			  assign RegSrc = 2'b00;
			  
			  /*
			  Se instancia el Datapath
			  
			  DATAPATH(  input logic clk, reset,
					 input logic [1:0] RegSrc,
					 input logic RegWrite,
					 input logic [1:0] ImmSrc,
					 input logic ALUSrc,
					 input logic [1:0] ALUControl,
					 input logic MemtoReg,
                input logic PCSrc,
					 output logic [3:0] ALUFlags,
					 output logic [31:0] PC,
					 input logic [31:0] Instr,
					 output logic [31:0] ALUResult, WriteData,
					 input logic [31:0] ReadData		
						
				);
			  
			  */
			  
			  DATAPATH dp(clk,reset,RegSrc,RegWrite,ImmSrc,ALUSrc,ALUControl,
			  MemtoReg,PCSrc,ALUFlags,PC,Instr,ALUResult,WriteData,ReadData);
endmodule
