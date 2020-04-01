`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2019 01:57:19 AM
// Design Name: 
// Module Name: CSIM
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


module CSIM();
    logic CLK = 0, FLG_C_SET = 0, FLG_C_LD = 0, FLG_C_CLR = 0,C = 0,C_FLAG = 0;
    C CReg(.*);
    
    always
    begin
        CLK = ~CLK; #5;
    end
    
    initial
    begin
    FLG_C_LD = 1; C = 0; #10;
    FLG_C_LD = 1; C = 1; #10;
    FLG_C_CLR = 1;C = 1; #10;
    FLG_C_CLR = 0; FLG_C_LD = 0; FLG_C_SET = 1; C = 0; #10;
    end
    

endmodule
