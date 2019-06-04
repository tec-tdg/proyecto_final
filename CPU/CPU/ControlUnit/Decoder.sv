module Decoder (input logic [3:0] Rd,
					 input logic [1:0] Op,
					 input logic [5:0] Funct,
					 output logic PCS,
					 output logic RegW,
					 output logic MemW,
					 output logic [1:0] ALUControl,
					 output logic [1:0] FlagW,
					 output logic [1:0] ImmSrc,
					 output logic [1:0] RegSrc,
					 output logic MemtoReg, ALUSrc,
	
	logic [9:0] controls;
	logic Branch, ALUOp;
		// Main Decoder
	always_comb
		casex(Op)
		// Data-processing immediate
			2'b00: if (Funct[5]) controls = 10'b0001001001;
		// Data-processing register
					else controls = 10'b0000001001;
		// LDR
			2'b01: if (Funct[0]) controls = 10'b0101011000;
		// STR
					else controls = 10'b0011010100;
		// B
			2'b10: controls = 10'b1001100010;
		// Unimplemented
			default: controls = 10'bx;
		endcase
		
	assign {Branch, MemtoReg, MemW, ALUSrc, ImmSrc, RegW, RegSrc, ALUOp} = controls;
	
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
	// PC Logic
	assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule
