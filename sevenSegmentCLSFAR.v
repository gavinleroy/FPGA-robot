`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:09 04/11/2017 
// Design Name: 
// Module Name:    sevenSegmentCLSFAR 
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
module sevenSegmentCLSFAR(
		input clk,
		input led,
		output reg [6:0] disp,
		output reg [3:0] an
    );
	 
	 //Declare register count
	 reg [1:0] count;
	 
	 //Hard code the individual letters
	 parameter 
		C = 7'b1000110,
		L = 7'b1000111,
		S = 7'b0010010,
		E = 7'b0000110,
	 nothing = 7'b1111111;

	 //Initialize
	 initial begin
		disp <= nothing;
		an <= 4'b1111;
		count <= 2'b00;
	 end
	 
	 
	 always @(posedge clk)begin
		count <= count + 1;
	 end // always
	 
	 
	 always @(posedge clk)begin
		if (led == 1)begin
			case(count)
			2'b00:begin 
				disp <= E;
				an <= 4'b0111;
			end 
			2'b01: begin
				disp <= C;
				an <= 4'b1110;
			end
			
			2'b10: begin
				disp <= L;
				an <= 4'b1101;
			end
			2'b11: begin
				disp <= S;
				an <= 4'b1011;
			end
			
		endcase
		end //if led == 1
		
		else begin
			disp <= nothing;
			an <= 4'b1111; 
		end //else if led == 0
		
	 end //always
	 
endmodule
