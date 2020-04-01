`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2019 11:38:04 AM
// Design Name: 
// Module Name: REG_FILE
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


module REG_FILE(
    input RF_WR,CLK,
    input [4:0]ADRX,ADRY,
    input [7:0]DIN,
    output logic [7:0] DX_OUT,DY_OUT
    );
    
    logic [7:0]RAM[31:0];
    initial
    begin
        int i;
        for (i = 0;i < 32;i++)
            RAM[i] = 0;
    end 
    
    always_ff@(posedge CLK)
    begin
        if (RF_WR)
            RAM[ADRX] <= DIN;
    end
            
    assign DX_OUT = RAM[ADRX];
    assign DY_OUT = RAM[ADRY];
    
endmodule
