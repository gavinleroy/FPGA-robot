`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:10 04/18/2017 
// Design Name: 
// Module Name:    robot_Top 
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
module robot_Top(
	input clk,
	input echo,
	input ir,
	output trigger,
	input lightDetector,
	output [6:0] disp,
	output [3:0] an,
	output echoPulse,
	output speaker,
	output pulseLeft,
	output pulseRight
    );
	 
	 wire isDark;
	 wire turningW;
	 wire clseW;
	 wire leftW;
	 wire rightW;
	 wire forwardW;
	 wire newClk;
	 
	 //Slow clk: every microsecond
	 ClockDivider heartBeat(
		.clkin(clk), //input clk
		.clkout(newClk) //output slow clk
	 );
	 
	 sensor_top theEyes(
		.clk(newClk), //input slower clk
		.myOutput(clseW), //wire telling whether to turn or not
		.led3(echoPulse), //output pulses from the sensor
		.echo(echo), //input wire from the sensor
		.disp(disp), //actual seven segment
		.an(an), //choose which display on the 7 segment
		.trigger(trigger) //output wire to the sensor
	 );
	 
	 top theBrains(
		.ir(ir),
		.clkin(clk), //input regular clk from the board
		.up(forwardW), //outputs a signal to move forward
		.right(rightW), //outputs a signal to turn right
		.left(leftW) //outputs a signal to turn left
	 );
	 
	 doubleMotor_top theLegs(
		.clk(newClk), //input slower clk
		.forward(forwardW), //input signal to move forward
		.turnLeft(leftW), //input signal to turn left
		.turnRight(rightW), //input signal to turn right
		.pulseLeft(pulseLeft), //output VCC to left wheel
		.pulseRight(pulseRight), //output VCC to right wheel
		.tooClose(clseW),//90 degree turn if too close to something
		.turning(turningW) //output if the robot is turning bc too close to something
	 );
	 
	 photoResistor theCornea(
		.a(lightDetector), //input from the light detector
		.dark(isDark) //output telling if it is dark or not
	 );
	 
	 topSpeaker theVoice(
		.clk(clk), //input normal clk
		.pizo(speaker), //output for the sound
		.soundOn(turningW || isDark) //input to turn the sound 
											  //on when turning or room is dark 
	 );
	 
	 
	 
endmodule
