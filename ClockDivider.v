`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:16 01/19/2017 
// Design Name: 
// Module Name:    ClockDivider 
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

module ClockDivider(
    input clkin,
	 output reg clkout
	 );
	 
	 reg [25:0] count;
	 
	 initial begin
		count = 0;
		clkout = 0;
	 end

	 always @(posedge clkin) begin
		//if (count == 26'b1011_1110_1011_1100_0010_0000_00) begin
		if (count == 26'd50) begin
			count <= 0;
			clkout <= ~clkout;
		end
		else begin
			count <= count + 1;
		end
end		


endmodule
