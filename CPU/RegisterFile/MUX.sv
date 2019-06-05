module MUX #(parameter N=32) (
	input [N-1:0] a, b, c, d, e, f,g, h,i, j,k, l, m, n, o, p, 
	input [3:0] selection_i, 
	output [N-1:0] result);
	
	logic [N-1:0] y_o;
	always_comb
	case(selection_i)
		4'b0000:   y_o = a ;
		4'b0001:   y_o = b ;
		4'b0010:   y_o = c ;
		4'b0011:   y_o = d ;
		4'b0100:   y_o = e ;
		4'b0101:   y_o = f ;
		4'b0110:   y_o = g ;
		4'b0111:   y_o = h ;
		4'b1000:   y_o = i ;
		4'b1001:   y_o = j ;
		4'b1010:   y_o = k ;
		4'b1011:   y_o = l ;
		4'b1100:   y_o = m ;
		4'b1101:   y_o = n ;
		4'b1110:   y_o = o ;
		4'b1111:   y_o = p ;
		
		default: y_o = 32'bz;
	endcase
	
	assign result = y_o;
	 
endmodule
