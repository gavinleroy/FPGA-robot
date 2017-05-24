`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:37:26 04/18/2017 
// Design Name: 
// Module Name:    motot_top 
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
module motot_top(
	input clk,
	input forward,
	input backward,
	output signal
	);
	
	motorMain lolThisMotor(
		.clk(clk),
		.backward(backward),
		.forward(forward),
		.pulseHigh(signal)
	);

endmodule
