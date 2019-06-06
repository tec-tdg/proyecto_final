module MUX_4 #(parameter N=4) (
	input [N-1:0] a, b, 
	input  selection_i, 
	output [N-1:0] result);
	
	logic [N-1:0] y_o;
	always_comb
	case(selection_i)
		2'b0000:   y_o = a ;
		2'b0001:   y_o = b ;
		
		
		default: y_o = 4'bz;
	endcase
	
	assign result = y_o;
	 
endmodule
