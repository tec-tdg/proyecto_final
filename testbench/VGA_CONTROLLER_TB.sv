module VGA_CONTROLLER_TB();

//timeunit 39ns;

logic [9:0] hcnt, vcnt;
logic vgaclk=0, reset, hsync, vsync, sync_b, blank_b;

VGA_CONTROLLER dut(vgaclk, reset, hsync, vsync, sync_b, blank_b, hcnt, vcnt);

initial begin
reset=1; #3 reset=0;
end

always #1 vgaclk = ~vgaclk;

endmodule
