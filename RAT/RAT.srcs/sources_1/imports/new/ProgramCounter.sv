`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2019 02:41:41 PM
// Design Name: 
// Module Name: Program Counter
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


module ProgramCounter(
    input[9:0]DIN,
    input PC_LD,PC_INC,RST,CLK,
    output logic [9:0] PC_COUNT
    );
    
    
    always_ff@(posedge CLK)
    begin
    if (RST)
        PC_COUNT <= 0;
    else if (PC_LD)
        PC_COUNT <= DIN;
    else if (PC_INC)
        PC_COUNT <= PC_COUNT + 1;
    else
        PC_COUNT <= PC_COUNT;
    end
endmodule
