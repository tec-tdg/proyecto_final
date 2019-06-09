module ControlUnit_tb();
  
  /*
  ControlUnit (input logic clk, reset,
						  input logic [31:12] Instr,
						  input logic [3:0] ALUFlags,
						  output logic [1:0] RegSrc,
						  output logic RegWrite,
						  output logic [1:0] ImmSrc,
						  output logic ALUSrc,
						  output logic [1:0] ALUControl,
						  output logic MemWrite,MemtoReg,
						  output logic PCSrc	
						  );*/
 //inputs
  logic clk,reset;
  logic [31:0] Instru; //Instrucción
 //Outputs
  logic [3:0] ALUFlags;
  
  logic [1:0]RegSrc;// controla si es 15 o R1 (bit 0) controla si es Instrc[3:0] o Instruc[15:12]
  logic RegWrite;
  logic [1:0] ImmSrc;
  logic ALUSrc;
  logic [1:0] ALUControl;
  logic MemWrite,MemtoReg;
  logic PCSrc;
  
  initial begin
    assign reset = 0;
    //ADD R0, R0, #42
    assign Instru =32'b	1110_00_1_0100_0_0000_0000_0000_00101010;
    #100
    assign reset = 1;
  end
  
  ControlUnit dut(
              clk,
              reset,
    			  Instru[31:12],
              ALUFlags,
              RegSrc,
              RegWrite,
              ImmSrc,
              ALUSrc,
              ALUControl,
              MemWrite,MemtoReg,
              PCSrc	);
endmodule
