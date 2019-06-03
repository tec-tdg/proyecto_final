//Tomado del libro HDL Example 5.6 RAM

//Evoluciona a 387 del libro de texto
module REGISTER_FILE_STRUCTURAL #(parameter N = 4,parameter M = 32)
				(  input logic   clk,reset,
					input logic   WE3,
					
					input reg   [N-1:0]  A1,
					input reg   [N-1:0]  A2,
					input reg   [N-1:0]  A3,
					
					input logic   [M-1:0]  WD3,
					
					input logic   [M-1:0]  R15,
					
					
					output reg  [M-1:0] RD1,
					output reg  [M-1:0] RD2);


// Se instancia el DECODER

//DECODER(input logic [3:0] address, output logic [15:0] outputdata);

DECODER decoder(A3,decoder_output);

logic [15:0]decoder_output;


//Se crean los enable de los registros		  
		
logic WER0,WER1,WER2,WER4,WER5,WER6,WER7,WER8,WER9,WER10,WER11,WER12,WER13,WER14,WER15;		
		
//Se asignan los Wright enable

assign WER0= WE3 & decoder_output[0];
assign WER1= WE3 & decoder_output[1];  
assign WER2= WE3 & decoder_output[2];
assign WER3= WE3 & decoder_output[3];  
assign WER4= WE3 & decoder_output[4];
assign WER5= WE3 & decoder_output[5];  
assign WER6= WE3 & decoder_output[6];
assign WER7= WE3 & decoder_output[7]; 
assign WER8= WE3 & decoder_output[8];
assign WER9= WE3 & decoder_output[9];  
assign WER10= WE3 & decoder_output[10];
assign WER11= WE3 & decoder_output[11];  
assign WER12= WE3 & decoder_output[12];
assign WER13= WE3 & decoder_output[13];  
assign WER14= WE3 & decoder_output[14];

//Verificar escritura de R15 en cada ciclo
assign WER15= WE3 & decoder_output[15];   

//Se instancian los registros
//module REGISTER(parameter M = 32)(  input logic   clk,input logic   WE,
//input logic [M-1:0] DATA_IN,output reg  [M-1:0] RD,);		

//Se crean los RD de los registros		  
		
logic RDR0,RDR1,RDR2,RDR4,RDR5,RDR6,RDR7,RDR8,RDR9,RDR10,RDR11,RDR12,RDR13,RDR14,RDR15;

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
 REGISTER Registro15(clk,WER15,R15,RDR15);

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
