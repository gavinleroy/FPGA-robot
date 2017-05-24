`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:44 03/30/2017 
// Design Name: 
// Module Name:    sensor_top 
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
module sensor_top(
	input clk,
	output myOutput,
	output led3,
	input echo,
	output [6:0] disp,
	output [3:0] an,
	output trigger
    );
	 
	 //internal wires
	 wire connectDisplay;
	 
	 //Assign Wires
	 assign myOutput = connectDisplay;
	 
	 sensorTwoBlock twoBlock(
		.clk(clk),
		.led(connectDisplay),
		.led3(led3),
		.echo(echo),
		.trigger(trigger)
	 );
	 
	 sevenSegmentCLSFAR display(
		.clk(clk),
		.led(connectDisplay),
		.an(an),
		.disp(disp)
	 );
	
endmodule
