module VGA (input logic clk,
				output logic hsync_out, vsync_out, sync_b_out, blank_b_out,clk_out,
				output logic [7:0] red,green,blue);

	//Frequency devider
	 logic reset;
	 assign reset = 0;
	 FREQ_DIVIDER freq_divider(clk, reset,clk_out);
	 
	 
	 //VGA_CONTROLLER input logic vgaclk, reset,
    //output logic hsync, vsync, sync_b, blank_b,
    //output logic [9:0] hcnt, vcnt
	
	 logic [9:0] hcnt_out, vcnt_out;
	 VGA_CONTROLLER vga_controller( clk_out, reset, hsync_out, vsync_out, sync_b_out, blank_b_out, hcnt_out, vcnt_out);
	 
	 	 //Set the color
		 
	 always @ *
		if (0 <= vcnt_out & vcnt_out < 192 ) begin 
		//DAE8FC
			 red = 8'hDA;
			 green = 8'hE8;
			 blue = 8'hFC;
		end
		
		else if ((vcnt_out == 192) | (vcnt_out >= 192 & hcnt_out == 0 )   | 
											  (vcnt_out >= 192 & hcnt_out == 90 )  | 
											  (vcnt_out >= 192 & hcnt_out == 180 ) | 
											  (vcnt_out >= 192 & hcnt_out == 270 ) | 
											  (vcnt_out >= 192 & hcnt_out == 360 ) | 
											  (vcnt_out >= 192 & hcnt_out == 450 ) | 
											  (vcnt_out >= 192 & hcnt_out == 540 ) | 
											  (vcnt_out >= 192 & hcnt_out == 640 )) begin 
			 red = 8'b0000_0000;
			 green = 8'b0000_0000;
			 blue = 8'b0000_0000;
		
		end
		
		else if ((vcnt_out >= 192) & (vcnt_out <= 400) & (  (  65 <= hcnt_out  & hcnt_out <= 115)  | 
																			 (  155 <= hcnt_out  & hcnt_out <= 205) | 
																			 (245 <= hcnt_out  & hcnt_out <= 295)   | 
																			 (425 <= hcnt_out  & hcnt_out <= 475)   |  
																			 (515 <= hcnt_out  & hcnt_out <= 565) )) begin 
			 red = 8'b0000_0000;
			 green = 8'b0000_0000;
			 blue = 8'b0000_0000;
		
		end
		
		else begin 
			 red = 8'b1111_1111;
			 green = 8'b1111_1111;
			 blue = 8'b1111_1111;
		end
	
			
	 
	
		

	 	 
	 
endmodule
