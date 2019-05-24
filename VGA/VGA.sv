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
	 assign red = 8'b0000_0000;
	 assign green = 8'b1111_1111;
	 assign blue = 8'b0000_0000;
	 
	 
endmodule
