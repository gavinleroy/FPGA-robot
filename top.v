`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:57:21 04/04/2017 
// Design Name: 
// Module Name:    top 
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

module top(ir, clkin, up, right, left);

input ir;
input clkin;
output reg up;
output reg right;
output reg left;

reg [25:0] count;
reg [25:0] irCount;

initial begin
		 irCount = 0;
		 count = 0;
		 up = 0;
		 left = 0;
		 right = 0;
end

always @ (posedge clkin) begin
	if (count == 26'd25000000) begin
		count <= 0;
		if (~ir) begin
			irCount <= irCount + 1;
		end
		if (irCount >= 26'd6700000) begin
			up <= 0;
			left <= 1;
			right <=0;
			irCount <= 0;
		end
		else if (irCount >= 26'd6500000) begin
			up <= 0;
			left <= 0;
			right <=1;
			irCount <= 0;
		end
		else if (irCount >= 26'd5000000) begin 
			up <= 1;
			left <= 0;
			right <=0;
			irCount <= 0;
		end
		else begin
			up <= 0;
			left <= 0;
			right <=0;
			irCount <= 0;
		end
	end
	else begin
		if (~ir) begin
			irCount <= irCount + 1;
		end
		count <= count + 1;
	end
end
endmodule
