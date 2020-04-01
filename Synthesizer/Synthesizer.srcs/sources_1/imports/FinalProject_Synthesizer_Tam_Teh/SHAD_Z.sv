`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2019 11:42:32 AM
// Design Name: 
// Module Name: SHAD_Z
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


module SHAD_Z(
    input IN,LD,CLK,
    output logic OUT
    );
    
    always_ff@(posedge CLK)
    begin
        if (LD)
            OUT = IN;
    end
    
endmodule
