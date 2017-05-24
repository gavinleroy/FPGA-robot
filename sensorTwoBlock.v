`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:16 04/06/2017 
// Design Name: 
// Module Name:    sensorTwoBlock 
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
module sensorTwoBlock(
	input clk,
	input echo,
	output reg trigger,
	output led3,
	output reg led
    );
	 //LED2 is used for outputting FAr, kind of buggy rn so maybe
	 //get rid of it...
	 
			//Declare variables
			reg [31:0] count;
			reg [15:0] countAlways;	
			
			//Assign Wires
			assign led3 = echo;
			
			//initialize variables
			initial begin
				count = 32'd0;
				trigger = 0;
				countAlways = 16'd0;
				led = 0;
			end
			
			//Send a 10 microsecond pulse then wait for 60000 microseconds
			always @(posedge clk)begin

				countAlways <= countAlways + 1;
				
				count <= count + 1;
				
				
				if(countAlways == 16'd10 && trigger == 1)begin
					trigger = 0;
					count <= 32'd0;

				end
				else if(countAlways == 16'd60000 && trigger == 0)begin
					countAlways <= 16'd0;
					
					//count <= 32'd0;

					trigger = 1;
				end
			end
			
			/*When the echo falls, compute to see 
			if it's less than my calculated value for 15 cm*/
			
			always @(negedge echo)begin 
					if (count < 32'd1044) begin
						led = 1;
					end//if
					else if(count > 32'd11600)begin
						led = 0;
					end//else if
					else begin
						led = 0;
					end//else
			end

endmodule
