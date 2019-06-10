module ps2
	(
		input logic clk, reset, 
		input logic ps2d, ps2c, rx_en,    // ps2 data and clock inputs, receive enable input
		output logic rx_done_tick,         // ps2 receive done tick
		output logic [7:0] rx_data,
      output logic status		// data received 
	);
	
	// FSMD state declaration
	localparam 
		idle = 1'b0,
		rx   = 1'b1;
		
	// internal signal declaration
	logic state_logic, state_next;          // FSMD state logicister
	logic [7:0] filter_logic;               // shift logicister filter for ps2c
	logic [7:0] filter_next;             // next state value of ps2c filter logicister
	logic f_val_logic;                      // logic for ps2c filter value, either 1 or 0
	logic f_val_next;                    // next state for ps2c filter value
	logic [3:0] n_logic, n_next;            // logicister to keep track of bit number 
	logic [10:0] d_logic, d_next;           // logicister to shift in rx data
	logic neg_edge;                      // negative edge of ps2c clock filter value
	
	// logicister for ps2c filter logicister and filter value
	always @(posedge clk, posedge reset)
		if (reset)
			begin
			filter_logic <= 0;
			f_val_logic  <= 0;
			end
		else
			begin
			filter_logic <= filter_next;
			f_val_logic  <= f_val_next;
			end

	// next state value of ps2c filter: right shift in current ps2c value to logicister
	assign filter_next = {ps2c, filter_logic[7:1]};
	
	// filter value next state, 1 if all bits are 1, 0 if all bits are 0, else no change
	assign f_val_next = (filter_logic == 8'b11111111) ? 1'b1 :
			    (filter_logic == 8'b00000000) ? 1'b0 :
			    f_val_logic;
	
	// negative edge of filter value: if current value is 1, and next state value is 0
	assign neg_edge = f_val_logic & ~f_val_next;
	
	// FSMD state, bit number, and data logicisters
	always @(posedge clk, posedge reset)
		if (reset)
			begin
			state_logic <= idle;
			n_logic <= 0;
			d_logic <= 0;
			end
		else
			begin
			state_logic <= state_next;
			n_logic <= n_next;
			d_logic <= d_next;
			end
	
	// FSMD next state logic
	always @*
		begin
		
		// defaults
		state_next = state_logic;
		rx_done_tick = 1'b0;
		n_next = n_logic;
		d_next = d_logic;
		
		case (state_logic)
			
			idle:
				if (neg_edge & rx_en)                 // start bit received
					begin
					n_next = 4'b1010;             // set bit count down to 10
					state_next = rx;              // go to rx state
					end
				
			rx:                                           // shift in 8 data, 1 parity, and 1 stop bit
				begin
				if (neg_edge)                         // if ps2c negative edge...
					begin
					d_next = {ps2d, d_logic[10:1]}; // sample ps2d, right shift into data logicister
					n_next = n_logic - 1;           // decrement bit count
					end
			
				if (n_logic==0)                         // after 10 bits shifted in, go to done state
                                        begin
					 rx_done_tick = 1'b1;         // assert dat received done tick
					 state_next = idle;           // go back to idle
					 end
				end
		endcase
		end
		
	assign rx_data = d_logic[8:1]; // output data bits 
	assign status = ~(ps2c & ps2d); 
endmodule
