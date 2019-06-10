	module Decoder (input logic [1:0] Op,
					 input logic [5:0] Funct,
					 input logic [3:0] Rd,
					 output logic [1:0] FlagW,
					 output logic PCS,
					 output logic RegW,
					 output logic MemW,
					 output logic MemtoReg, ALUSrc, 
					 output logic [1:0] ImmSrc,
					 output logic [1:0] RegSrc,
					 output logic [1:0] ALUControl,
					 output logic NoWrite
					 );
	
	logic [9:0] controls;
	logic Branch, ALUOp;
		// Main Decoder
	always_comb
		casex(Op)
		// Data-processing immediate
			2'b00: if (Funct[5]) controls = 10'b00_00_1_0_1_0_0_1;
		// Data-processing register
					else controls = 10'b00_00_0_0_1_0_0_1;
		// LDR
			2'b01: if (Funct[0]) controls = 10'b00_01_1_1_1_0_0_0;
		// STR
					else controls = 10'b10_01_1_1_0_1_0_0;
		// B
			2'b10: controls = 10'b01_10_1_0_0_0_1_0;
			default: controls = 10'bx;
		endcase
		
	assign ALUOp = controls[0];
	assign Branch = controls[1];
	assign MemW	= controls[2];
	assign RegW = controls[3];
	assign MemtoReg = controls[4];
	assign ALUSrc = controls[5];
	assign ImmSrc = controls[7:6];
	assign RegSrc = controls[9:8];
	
	//assign {RegSrc, ImmSrc,ALUSrc,MemtoReg,RegW,MemW,Branch, ALUOp} = controls;
	
	// ALU Decoder
	always_comb
		if (ALUOp) begin // which DP Instr?
			case(Funct[4:1])
				4'b0100: ALUControl = 2'b00; // ADD
				4'b0010: ALUControl = 2'b01; // SUB
				4'b0000: ALUControl = 2'b10; // AND	
				4'b1100: ALUControl = 2'b11; // OR
				default: ALUControl = 2'bx; // unimplemented
			endcase

	// update flags if S bit is set (C & V only for arith)	
			FlagW[1] = Funct[0];
			FlagW[0] = Funct[0] &
			(ALUControl == 2'b00 | ALUControl == 2'b01);
				
			end 
			else begin
				ALUControl = 2'b00; // add for non-DP instructions
				FlagW = 2'b00; // don't update Flags
			end
			
			logic[6:0] caseCond;
			assign caseCond = {ALUOp, Funct};
			
			always @(*) begin
		casex (caseCond) 
		  7'b0Xxxxxx :NoWrite <= 0;  // NOT DP
		  7'b1X01000 :NoWrite <= 0;  // ADD						  
		  7'b1X01001 :NoWrite <= 0;  // ADD						  
		  7'b1X00100 :NoWrite <= 0;  // SUB		  
		  7'b1X00101 :NoWrite <= 0;  // SUB						  
		  7'b1X00000 :NoWrite <= 0;  // AND						  
		  7'b1X00001 :NoWrite <= 0;  // AND						  
		  7'b1X11000 :NoWrite <= 0;  // ORR						  
		  7'b1X11001 :NoWrite <= 0;  // ORR						  
		  7'b1X10101 :NoWrite <= 1;  // CMP						  
		  7'b1X00010 :NoWrite <= 0;  // XOR						  
		  7'b1011010 :NoWrite <= 0;  // LSR						  
		  7'b1111010 :NoWrite <= 0;  // MOV pos
		  7'b1111110 :NoWrite <= 0;  // MOV neg						  
		  7'b1010010 :NoWrite <= 0;  // B						  
		  default :NoWrite <= 0;		  
		endcase
		end
	// PC Logic
	assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule
