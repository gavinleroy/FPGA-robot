`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:56 04/18/2017 
// Design Name: 
// Module Name:    motorMain 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module motorMain(
	input clk,
	input backward,
	input forward,
	output reg pulseHigh
    );
	 
	 reg [15:0] count;
	 
	 initial begin
		pulseHigh = 0;
		count = 16'd0;
	 end	
	 
	 always @(posedge clk)begin
		count <= count + 1;
			if (forward == 1 && backward == 0)begin
				if (count == 16'd300 && pulseHigh == 1)begin
					pulseHigh <= 0;
					count <= 16'd0;
				end// nested if
				else if(count == 16'd20000 && pulseHigh == 0)begin
					pulseHigh <= 1;
					count <= 16'd0;
				end//nested else if
			end//if
			else if(backward == 1 && forward == 0)begin
				if(count == 16'd700 && pulseHigh == 1)begin
					pulseHigh <= 0;
					count <= 16'd0;
				end//nested if
				else if(count == 16'd20000 && pulseHigh == 0) begin
					pulseHigh <= 1;
					count <= 16'd0;
				end//nested else if
			end
			else begin
				if (count == 16'd500 && pulseHigh == 1)begin
					pulseHigh <= 0;
					count <= 16'd0;
				end//nested if
				else if(count == 16'd20000 && pulseHigh == 0) begin
					pulseHigh <= 1;
					count <= 16'd0;
				end//nested else if
			end
		
			
	 end


endmodule
