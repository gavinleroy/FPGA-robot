`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:10 04/20/2017 
// Design Name: 
// Module Name:    doubleMotor 
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
module doubleMotor(
	input clk,
	input forward,
	input turnLeft,
	input turnRight,
	input tooClose,
	output pulseLeft,
	output pulseRight,
	output reg startCount
    );
	 
	 reg turnForwardL;
	 reg turnForwardR;
	 reg turnBackwardL;
	 reg turnBackwardR;
	 reg [31:0] countIt;
	 
	 initial begin
		startCount <= 0; 
	 end//inital
	 
	always @(posedge clk)begin
		if (startCount == 1)begin
				countIt <= countIt + 1;
			end//if	
			else begin
				countIt <= 32'd0;
			end//else
	end//always posedge clk
	 
	 always @(posedge clk)begin
		if (countIt == 32'd600000 || (countIt > 32'd600000 && tooClose == 0))begin
			startCount <= 0;
		end//if
	 
		if (tooClose == 1 || (countIt < 32'd600000 && startCount == 1))begin
			turnBackwardL <= 0;
			turnBackwardR <= 0;
			turnForwardL <= 1;
			turnForwardR <= 1;
			startCount <= 1;
		end//if
		
		else if(turnLeft == 1 && startCount == 0)begin
			turnBackwardL <= 0;
			turnBackwardR <= 0;
			turnForwardL <= 1;
			turnForwardR <= 1;
		end//else if
		
		else if(forward && startCount == 0)begin
			turnForwardL <= 0;
			turnBackwardR <= 0;
			turnBackwardL <= 1;
			turnForwardR <= 1;
		end//else if
		
		else if(turnRight == 1 && startCount == 0)begin
			turnForwardL <= 0;
			turnForwardR <= 0;
			turnBackwardL <= 1;
			turnBackwardR <= 1;
		end//else if
		
		else begin
			turnBackwardL <= 0;
			turnBackwardR <= 0;
			turnForwardL <= 0;
			turnForwardR <= 0;
		end//else
	 end



	motot_top leftWheel(
		.clk(clk),
		.forward(turnForwardL),
		.backward(turnBackwardL),
		.signal(pulseLeft)
	);
	
	motot_top rightWheel(
		.clk(clk),
		.forward(turnForwardR),
		.backward(turnBackwardR),
		.signal(pulseRight)
	);

endmodule
