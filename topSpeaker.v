`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:26 04/24/2017 
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

module topSpeaker(clk, pizo, soundOn);

input clk;
input soundOn;
//input btn0;
//input bnt1;
//input btn2;
//input btn3;

output reg pizo;

reg [25:0] count;

initial begin
	count = 0;
	pizo = 0;
end

always @ (posedge clk) begin
	if (soundOn) begin
		if (count == 26'd25000) begin
			count <= 0;
			pizo <= ~pizo;
		end
	
		else begin
			count <= count + 1;
		end
	end
end		

endmodule

/*
module top(clk, pizo);

input clk;
//input btn0;
//input bnt1;
//input btn2;
//input btn3;

output reg pizo;

reg [25:0] count;
reg [259:0] loop;
reg [25:0] sound;

initial begin
	count = 0;
	pizo = 0;
	loop = 0;
	sound = 26'd190840;
end

always @ (posedge clk) begin
	if (count == sound) begin
		count <= 0;
		loop <= loop + 1;
		pizo <= ~pizo;
	end
	
	else if (loop == 260'd8000) begin
		loop <= 0;
	end
	
	else begin
		count <= count + 1;
		case (loop)
			260'd0: begin
				sound <= 26'd190840;
			end
			260'd1000: begin
				sound <= 26'd170068;
			end
			260'd2000: begin
				sound <= 26'd151515;
			end
			260'd3000: begin
				sound <= 26'd143266;
			end
			260'd4000: begin
				sound <= 26'd127551;
			end
			260'd5000: begin
				sound <= 26'd113636;
			end
			260'd6000: begin
				sound <= 26'd101214;
			end
			260'd7000: begin
				sound <= 26'd95602;
			end
			default: begin
				sound <= 26'd190840;
			end
	endcase
  end
 end

endmodule

*/