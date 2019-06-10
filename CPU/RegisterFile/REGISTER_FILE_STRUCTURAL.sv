//Tomado del libro HDL Example 5.6 RAM

//Evoluciona a 387 del libro de texto
module REGISTER_FILE_STRUCTURAL #(parameter N = 4,parameter M = 32)
				(  input logic   clk,reset,
					input logic   WE3,
					input logic   [N-1:0]  A1,
					input logic   [N-1:0]  A2,
					input logic   [N-1:0]  A3,
					input logic   [M-1:0]  WD3,
					input logic   [M-1:0]  R15,
					output logic  [M-1:0] RD1,
					output logic  [M-1:0] RD2);




//Se crean los enable de los registros		  
		
logic   WER0, WER1, WER2, WER3, WER4, WER5, WER6, WER7, WER8,
		WER9, WER10, WER11, WER12, WER13, WER14, WER15 ;		
		
//Se asignan los Wright enable 
assign WER0  = WE3 & (A3 == 4'b0000);
assign WER1  = WE3 & (A3 == 4'b0001);
assign WER2  = WE3 & (A3 == 4'b0010);  
assign WER3  = WE3 & (A3 == 4'b0011);
assign WER4  = WE3 & (A3 == 4'b0100);  
assign WER5  = WE3 & (A3 == 4'b0101);
assign WER6  = WE3 & (A3 == 4'b0110);  
assign WER7  = WE3 & (A3 == 4'b0111);
assign WER8  = WE3 & (A3 == 4'b1000); 
assign WER9  = WE3 & (A3 == 4'b1001);
assign WER10 = WE3 & (A3 == 4'b1010);  
assign WER11 = WE3 & (A3 == 4'b1011);
assign WER12 = WE3 & (A3 == 4'b1100);  
assign WER13 = WE3 & (A3 == 4'b1101);
assign WER14 = WE3 & (A3 == 4'b1110); 



//Selector del mux de R15

assign WER15 = WE3 & (A3 == 4'b1111);   



//Verificar escritura de R15 en cada ciclo

//Logic Especial para R15
logic [M-1:0] RE15_mux_out;


//Se crea MUX de 2 enntradas para R15
/*module MUX_2 #(parameter N=4) (
	input [N-1:0] a, b, 
	input  selection_i, 
	output [N-1:0] result);*/
MUX_2 #(32) muxr15(R15,WD3,WER15,RE15_mux_out);


//Se instancian los registros
//module REGISTER(parameter M = 32)(  input logic   clk,input logic   WE,
//input logic [M-1:0] DATA_IN,output reg  [M-1:0] RD,);		

//Se crean los RD de los registros		  
		
logic [31:0] RDR0,RDR1,RDR2,RDR3,RDR4,RDR5,RDR6,RDR7,RDR8,RDR9,RDR10,RDR11,RDR12,RDR13,RDR14,RDR15;

/**
 REGISTER #(parameter M = 32)
				(  input logic   clk,reset,
					input logic   WE,
					input logic [M-1:0] DATA_IN,
					output reg  [M-1:0] RD
					);
**/
	
 REGISTER R0(clk,reset,WER0,WD3,RDR0);
 REGISTER R1(clk,reset,WER1,WD3,RDR1);
 REGISTER R2(clk,reset,WER2,WD3,RDR2);
 REGISTER R3(clk,reset,WER3,WD3,RDR3);
 REGISTER R4(clk,reset,WER4,WD3,RDR4);
 REGISTER R5(clk,reset,WER5,WD3,RDR5);
 REGISTER R6(clk,reset,WER6,WD3,RDR6);
 REGISTER R7(clk,reset,WER7,WD3,RDR7);
 REGISTER R8(clk,reset,WER8,WD3,RDR8);
 REGISTER R9(clk,reset,WER9,WD3,RDR9);
 REGISTER R10(clk,reset,WER10,WD3,RDR10);
 REGISTER R11(clk,reset,WER11,WD3,RDR11);
 REGISTER R12(clk,reset,WER12,WD3,RDR12);
 REGISTER R13(clk,reset,WER13,WD3,RDR13);
 REGISTER R14(clk,reset,WER14,WD3,RDR14);
 
 
 REGISTER Registro15(clk,reset,1'b1,RE15_mux_out,RDR15);
 
 	


//Se instancian los 2 muxes para RD1 Y RD2
//module MUX #(parameter N=1) (
//	input [N-1:0] a, b, c, d, e, f,g, h,i, j,k, l, m, n, o, p, 
//	input [3:0] selection_i, 
//	output [N-1:0] result);
MUX  multiplexer_rd1(RDR0,RDR1,RDR2,RDR3,RDR4,RDR5,RDR6,RDR7,RDR8,RDR9,RDR10,RDR11,RDR12,RDR13,RDR14,RDR15, 
								A1, 
								RD1);
								
MUX  multiplexer_rd2(RDR0,RDR1,RDR2,RDR3,RDR4,RDR5,RDR6,RDR7,RDR8,RDR9,RDR10,RDR11,RDR12,RDR13,RDR14,RDR15, 
								A2, 
								RD2);

								
								

endmodule
