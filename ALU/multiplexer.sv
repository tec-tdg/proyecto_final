module multiplexer #(parameter N=1) (
	input [N-1:0] sum_i, subs_i, and_i, or_i, not_i, xor_i,
	loglefshif_i, aritleftshif_i,logrightshif_i, aritrightshif_i,
F10_i, F11_i, F12_i, F13_i, F14_i, F15_i, 
	input [3:0] selection_i, 
	output [N-1:0] result);
	
	logic [N-1:0] y_o;
	always_comb
	case(selection_i)
		4'b0000:   y_o = sum_i ;
		4'b0001:   y_o = subs_i ;
		4'b0010:   y_o = and_i ;
		4'b0011:   y_o = or_i ;
		4'b0100:   y_o = not_i ;
		4'b0101:   y_o = xor_i ;
		4'b0110:   y_o = loglefshif_i ;
		4'b0111:   y_o = aritleftshif_i ;
		4'b1000:   y_o = logrightshif_i ;
		4'b1001:   y_o = aritrightshif_i ;
		4'b1010:   y_o = F10_i ;
		4'b1011:   y_o = F11_i ;
		4'b1100:   y_o = F12_i ;
		4'b1101:   y_o = F13_i ;
		4'b1110:   y_o = F14_i ;
		4'b1111:   y_o = F15_i ;
	endcase
	
	assign result = y_o;
	 
endmodule
