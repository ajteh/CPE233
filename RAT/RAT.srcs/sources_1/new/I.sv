`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2019 10:22:43 PM
// Design Name: 
// Module Name: I
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


module I(
    input I_SET,I_CLR,CLK,
    output logic OUT
    );
    
    always_ff@(posedge CLK)
    begin
        if (I_SET)
            OUT <= 1;
        else if (I_CLR)
            OUT <= 0;
    end
    
endmodule
