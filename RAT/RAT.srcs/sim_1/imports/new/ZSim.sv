`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2019 01:46:43 AM
// Design Name: 
// Module Name: ZSim
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


module ZSim();
    logic CLK = 0,FLG_Z_LD,Z,Z_FLAG = 0;    //Initialize CLK = 0, Z_FLAG = 0
    Z ZReg(.*);
    
    
    
    always
    begin
        CLK = ~CLK; #5;
    end
    
    initial
    begin
    FLG_Z_LD = 0; Z = 1; #10;
    
    FLG_Z_LD = 0; Z = 0; #10;
    
    FLG_Z_LD = 1; Z = 1; #10;
    
    FLG_Z_LD = 1; Z = 0; #10;
    end
endmodule
