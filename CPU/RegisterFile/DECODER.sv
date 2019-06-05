module DECODER(input logic [3:0] address, output logic [15:0] outputdata);


always_comb
begin
case (address)
            4'b0000: outputdata = 16'b0000_0000_0000_0001;
				4'b0001: outputdata = 16'b0000_0000_0000_0010;
				4'b0010: outputdata = 16'b0000_0000_0000_0100;
				4'b0011: outputdata = 16'b0000_0000_0000_1000;
				4'b0100: outputdata = 16'b0000_0000_0001_0000;
				4'b0101: outputdata = 16'b0000_0000_0010_0000;
				4'b0110: outputdata = 16'b0000_0000_0100_0000;
				4'b0111: outputdata = 16'b0000_0000_1000_0000;
				
				4'b1000: outputdata = 16'b0000_0001_0000_0000;
				4'b1001: outputdata = 16'b0000_0010_0000_0000;
				4'b1010: outputdata = 16'b0000_0100_0000_0000;
				4'b1011: outputdata = 16'b0000_1000_0000_0000;
				4'b1100: outputdata = 16'b0001_0000_0000_0000;
				4'b1101: outputdata = 16'b0010_0000_0000_0000;
				4'b1110: outputdata = 16'b0100_0000_0000_0000;
				4'b1111: outputdata = 16'b1000_0000_0000_0000;
				
				
				default: outputdata =16'b0;
          
        endcase


end



endmodule
