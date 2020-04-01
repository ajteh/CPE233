`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 11:42:11 AM
// Design Name: 
// Module Name: MUXSIM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUXSIM();
    logic [9:0]FROM_STACK,FROM_IMMED;
    logic [1:0]PC_MUX_SEL;
    logic [9:0]DIN;
    Mux Mux_inst(.*);
   
    initial
    begin
    FROM_STACK = 10; FROM_IMMED = 11; PC_MUX_SEL = 0; #10;    //CHECK TO SHOW FROM_IMMED @ DIN
    FROM_STACK = 10; FROM_IMMED = 11; PC_MUX_SEL = 1; #10;    //CHECK TO SHOW FROM_STACK @ DIN
    FROM_STACK = 10; FROM_IMMED = 11; PC_MUX_SEL = 2; #10;    //CHECK TO SHOW 0x3FF @ DIN
    FROM_STACK = 10; FROM_IMMED = 11; PC_MUX_SEL = 3; #10;    //CHECK TO SHOW 0x000 @ DIN
    
    end
endmodule
