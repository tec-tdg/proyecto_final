module DATAPATH_TB();

	/*
(  input logic clk, reset,
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
					 
				 
logic clk_t, reset_t;
logic [1:0] RegSrc_t;
logic RegWrite_t;
logic [1:0] ImmSrc_t;
logic ALUSrc_t;
logic [1:0] ALUControl_t;
logic MemtoReg_t;
logic PCSrc_t;
logic [3:0] ALUFlags_t;
logic [31:0] PC_t;
logic [31:0] Instr_t;
logic [31:0] ALUResult_t, WriteData_t;
logic [31:0] ReadData_t, SrcA_t, SrcB_t, ExtImm_t;
logic [3:0]RA1,RA2;	
	
						
  
  DATAPATH dut( clk_t, reset_t,RegSrc_t,RegWrite_t,
 ImmSrc_t,ALUSrc_t, ALUControl_t, MemtoReg_t,PCSrc_t,
  ALUFlags_t, PC_t, Instr_t,ALUResult_t, WriteData_t, ReadData_t);
				  
	initial begin 
	//0xE281002A   / 	1110_00_1_0100_0_0000_0000_0000_00101010
	//ADD R0, R0, #42
	 //1110 0010 1000 0000 0000 0000 0010 1010

		
	end
	 always @(negedge clk_t) begin 
		assign Instr_t = 32'b1110_00_1_0100_0_0000_0000_0000_00101010;
		/*
		
		RegSrc[1:0]: Se˜nales de selecci´on de muxes de operandos.
		00: caso proc. datos (op = 00)
		X1: caso branch (op = 10)
		10: caso STR (op = 01 y funct0 = 0)
		*/
		
		assign RegSrc_t = 2'b00;
		
		/*
		RegWrite**: se˜nal de escritura al banco de registros.
		0: no escritura a registros (else)
		1: escritura a registros por proc. o memoria ( op = 00 o
		op = 01 y funct0 = 1). Afectada por ejecuci´on condicional.

		*/
		assign RegWrite_t = 1 ;
		/*
		ImmSrc[1:0]: se˜nal de selecci´on de tipo de inmediato
		00: inmediato de proc. de datos, 8 bits (op = 00)
		01: inmediato de memoria, 12 bits (op = 01)
		10: inmediato de salto, 24 bits (op = 10)

		*/
		assign ImmSrc_t =2'b00;
		/*
		
		ALUSrc: se˜nal de selecci´on de operando B (R-R o R-I).
		0: caso R-R (op = 00 y funct5 = 0− > bit I )
		1: caso R-I (else)
		*/
		assign ALUSrc_t= 1;
		/*0100 : ADD, ALUControl - 00*/
		assign ALUControl_t= 2'b00;
		
		/*0: caso NO LDR
		1: caso LDR (op = 01 y funct0 = 1)*/
		assign MemtoReg_t= 0 ;
		/*
		PCSrc**: se˜nal fuente de PC, saltos y escrituras a PC
		0: caso no saltos (ni escrituras a PC)
		1: caso salto (op = 10) o escritura a PC (rd = 15 y
		RegWrite). Afectado por ejecuci´on condicional

		*/
		assign PCSrc_t= 0;
	 end
					 
  

endmodule
