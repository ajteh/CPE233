`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2019 12:27:09 AM
// Design Name: 
// Module Name: SCRATCH_RAM
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


module SCRATCH_RAM(
    input [9:0]DATA_IN,
    input SCR_WE,CLK,
    input [7:0]SCR_ADDR,
    output [9:0] DATA_OUT
    );
    logic [9:0] SCR_RAM [255:0];
    
    initial
    begin
        int i;
        for (i = 0;i < 256;i++)
            SCR_RAM[i] = 0;
    end 
    
    always_ff@(posedge CLK)
    begin
        if (SCR_WE)
            SCR_RAM[SCR_ADDR] <= DATA_IN;
    end
    
    assign DATA_OUT = SCR_RAM[SCR_ADDR];
    
endmodule
