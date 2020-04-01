`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2019 08:49:51 PM
// Design Name: 
// Module Name: StackPointer
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


module StackPointer(
    input RST, SP_LD, SP_INCR, SP_DECR,CLK,
    input [7:0] DIN,
    output logic [7:0]SP_DOUT = 0
    );
    
    always_ff @(posedge CLK)
    begin
        if (RST)
            SP_DOUT <= 0;
        else if (SP_LD)
            SP_DOUT <= DIN;
        else if (SP_INCR)
            SP_DOUT <= SP_DOUT + 1;
        else if (SP_DECR)
            SP_DOUT <= SP_DOUT - 1;      
    end
    
endmodule
