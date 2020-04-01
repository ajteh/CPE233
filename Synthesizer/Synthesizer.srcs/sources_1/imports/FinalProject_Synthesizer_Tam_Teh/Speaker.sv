`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2019 12:16:29 AM
// Design Name: 
// Module Name: Speaker
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


module SpeakerTop(
    input clk,
    input [7:0] Data,
    input [1:0] mode,
    output logic sclk
    );
    logic[19:0] t1; 
    
    Frequency_Decoder Frequency(.A(Data),.mode(mode),.decode(t1));  //Tells the clockDivider what to count to for what note
    clockdivider clockdivider (.clk(clk),.clockdividerNum(t1),.sclk(sclk));
endmodule
