`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2019 02:57:45 PM
// Design Name: 
// Module Name: ModeDecode
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


module ModeDecode(
    input clk,
    input [7:0] scancode,
    output logic [1:0] mode = 1
    );
    
    always_ff@(posedge clk) //This is a decoder that holds the value of which octave to play at
    begin
        if (scancode == 8'h03)
            mode <= 1;
        else if(scancode == 8'h0B)
            mode <= 2;
        else if(scancode == 8'h83)
            mode <= 3;
        else
            mode <= mode;
    end
    
endmodule
