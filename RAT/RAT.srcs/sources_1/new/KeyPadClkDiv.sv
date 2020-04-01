`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2019 01:38:26 PM
// Design Name: 
// Module Name: KeyPadClkDiv
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


module KeyPadClkDiv(
    input CLK,
    output logic SCLK = 0
    );
    logic [21:0]maxCount = 230000;
    logic [21:0] count;    
    always_ff@(posedge CLK)
    begin
        count += 1;
        if (count == maxCount)
            SCLK <= ~SCLK;
    end
        
endmodule
