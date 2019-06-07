`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Montvydas Klumbys	
// 
// Create Date:    
// Design Name: 
// Module Name:    Keyboard 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//	A module which is used to receive the DATA from PS2 type keyboard and translate that data into sensible codeword.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Keyboard_PS2(
	input CLK,	//board clock
   input PS2_CLK,	//keyboard clock and data signals
   input PS2_DATA,
   output logic [7:0] LED	//8 LEDs
   );
	
	logic [7:0] Q = 8'h15;
	logic [7:0] A = 8'h1C;
	logic [7:0] W = 8'h1D;
	logic [7:0] S = 8'h1B;
	logic [7:0] E = 8'h24;
	logic [7:0] D = 8'h23;
	logic [7:0] R = 8'h2D;
	logic [7:0] F = 8'h2B;
	logic [7:0] T = 8'h2C;
	logic [7:0] G = 8'h34;
	logic [7:0] Y = 8'h35;
	logic [7:0] H = 8'h33;


	logic read;				//this is 1 if still waits to receive more bits 
	logic [11:0] count_reading;		//this is used to detect how much time passed since it received the previous codeword
	logic PREVIOUS_STATE;			//used to check the previous state of the keyboard clock signal to know if it changed
	logic scan_err;				//this becomes one if an error was received somewhere in the packet
	logic [10:0] scan_code;			//this stores 11 received bits
	logic [7:0] CODEWORD;			//this stores only the DATA codeword
	logic TRIG_ARR;				//this is triggered when full 11 bits are received
	logic [3:0]COUNT;				//tells how many bits were received until now (from 0 to 11)
	logic TRIGGER = 0;			//This acts as a 250 times slower than the board clock. 
	logic [7:0]DOWNCOUNTER = 0;		//This is used together with TRIGGER - look the code

	//Set initial values
	initial begin
		PREVIOUS_STATE = 1;		
		scan_err = 0;		
		scan_code = 0;
		COUNT = 0;			
		CODEWORD = 0;
		LED = 0;
		read = 0;
		count_reading = 0;
	end

	always @(posedge CLK) begin				//This reduces the frequency 250 times
		if (DOWNCOUNTER < 249) begin			//and uses variable TRIGGER as the new board clock 
			DOWNCOUNTER <= DOWNCOUNTER + 1;
			TRIGGER <= 0;
		end
		else begin
			DOWNCOUNTER <= 0;
			TRIGGER <= 1;
		end
	end
	
	always @(posedge CLK) begin	
		if (TRIGGER) begin
			if (read)				//if it still waits to read full packet of 11 bits, then (read == 1)
				count_reading <= count_reading + 1;	//and it counts up this variable
			else 						//and later if check to see how big this value is.
				count_reading <= 0;			//if it is too big, then it resets the received data
		end
	end


	always @(posedge CLK) begin		
	if (TRIGGER) begin						//If the down counter (CLK/250) is ready
		if (PS2_CLK != PREVIOUS_STATE) begin			//if the state of Clock pin changed from previous state
			if (!PS2_CLK) begin				//and if the keyboard clock is at falling edge
				read <= 1;				//mark down that it is still reading for the next bit
				scan_err <= 0;				//no errors
				scan_code[10:0] <= {PS2_DATA, scan_code[10:1]};	//add up the data received by shifting bits and adding one new bit
				COUNT <= COUNT + 1;			//
			end
		end
		else if (COUNT == 11) begin				//if it already received 11 bits
			COUNT <= 0;
			read <= 0;					//mark down that reading stopped
			TRIG_ARR <= 1;					//trigger out that the full pack of 11bits was received
			//calculate scan_err using parity bit
			if (!scan_code[10] || scan_code[0] || !(scan_code[1]^scan_code[2]^scan_code[3]^scan_code[4]
				^scan_code[5]^scan_code[6]^scan_code[7]^scan_code[8]
				^scan_code[9]))
				scan_err <= 1;
			else 
				scan_err <= 0;
		end	
		else  begin						//if it yet not received full pack of 11 bits
			TRIG_ARR <= 0;					//tell that the packet of 11bits was not received yet
			if (COUNT < 11 && count_reading >= 4000) begin	//and if after a certain time no more bits were received, then
				COUNT <= 0;				//reset the number of bits received
				read <= 0;				//and wait for the next packet
			end
		end
	PREVIOUS_STATE <= PS2_CLK;					//mark down the previous state of the keyboard clock
	end
	end


	always @(posedge CLK) begin
		if (TRIGGER) begin					//if the 250 times slower than board clock triggers
			if (TRIG_ARR) begin				//and if a full packet of 11 bits was received
				if (scan_err) begin			//BUT if the packet was NOT OK
					CODEWORD <= 8'd0;		//then reset the codeword logicister
				end
				else begin
					CODEWORD <= scan_code[8:1];	//else drop down the unnecessary  bits and transport the 7 DATA bits to CODEWORD logic
				end				//notice, that the codeword is also reversed! This is because the first bit to received
			end					//is supposed to be the last bit in the codeword…
			else CODEWORD <= 8'd0;				//not a full packet received, thus reset codeword
		end
		else CODEWORD <= 8'd0;					//no clock trigger, no data…
	end
	
	//always @(posedge CLK) begin
	always @ *
		if (CODEWORD == Q)			
			LED = 8'b11111111;
		else if (CODEWORD == A)			
			LED = 8'b00000001;
		else if (CODEWORD == W)			
			LED = 8'b00000010;
		else if (CODEWORD == S)			
			LED = 8'b00000011;
		else if (CODEWORD == E)			
			LED = 8'b00000100;
		else if (CODEWORD == D)			
			LED = 8'b00000101;
		else if (CODEWORD == R)			
			LED = 8'b00000110;
		else if (CODEWORD == F)			
			LED = 8'b00001000;
		else if (CODEWORD == T)			
			LED = 8'b00001001;
		else if (CODEWORD == G)			
			LED = 8'b00001010;
		else if (CODEWORD == Y)			
			LED = 8'b00001011;
		else if (CODEWORD == H)			
			LED = 8'b00001110;	
		else //if (CODEWORD!=Q||CODEWORD!=A||CODEWORD!=W||CODEWORD!=S||CODEWORD!=E||CODEWORD!=D||CODEWORD!=R||CODEWORD!=F||CODEWORD!=T||CODEWORD!=G||CODEWORD!=Y||CODEWORD!=H)
			LED <= 8'b00000000;
//	end
	
//	always @(negedge CLK) begin
//		LED <= 8'b00000000;
//		CODEWORD <= X;
//	end

endmodule


