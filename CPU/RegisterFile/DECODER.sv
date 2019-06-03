module DECODER(input logic [3:0] address, output logic [15:0] outputdata);


always_comb
begin
case (address)
            4'b0000: outputdata = 16'd0;
				4'b0001: outputdata = 16'd1;
				4'b0010: outputdata = 16'd2;
				4'b0011: outputdata = 16'd3;
				4'b0100: outputdata = 16'd4;
				4'b0101: outputdata = 16'd5;
				4'b0110: outputdata = 16'd6;
				4'b0111: outputdata = 16'd7;
				
				4'b1000: outputdata = 16'd8;
				4'b1001: outputdata = 16'd9;
				4'b1010: outputdata = 16'd10;
				4'b1011: outputdata = 16'd11;
				4'b1100: outputdata = 16'd12;
				4'b1101: outputdata = 16'd13;
				4'b1110: outputdata = 16'd14;
				4'b1111: outputdata = 16'd15;
				
          
        endcase


end



endmodule
