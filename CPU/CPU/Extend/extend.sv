module extend ( input logic [23:0] Instr,
					 input logic [1:0] ImmSrc,
					 output logic [31:0] ExtImm);

		always_comb
			case(ImmSrc)
				2'b00: ExtImm = {24'b0, Instr[7:0]};                  //Data Processing
				2'b01: ExtImm = {20'b0, Instr[11:0]};                  //Memory
				2'b10: ExtImm = {{6{Instr[23]}}, Instr[23:0], 2'b00}; //Branch
				default: ExtImm = 32'bx;                              //Undefined
			endcase
endmodule
