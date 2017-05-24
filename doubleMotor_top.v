`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:40 04/20/2017 
// Design Name: 
// Module Name:    doubleMotor_top 
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
module doubleMotor_top(
	input clk,
	input forward,
	input turnLeft,
	input turnRight,
	output pulseLeft,
	input tooClose,
	output pulseRight,
	output turning
    );
	 
	 doubleMotor bothWheels(
		.clk(clk),
		.pulseLeft(pulseLeft),
		.pulseRight(pulseRight),
		.forward(forward),
		.turnLeft(turnLeft),
		.turnRight(turnRight),
		.tooClose(tooClose),
		.startCount(turning)
	 );
	 


endmodule
