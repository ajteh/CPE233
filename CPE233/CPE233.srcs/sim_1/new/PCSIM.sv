`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 11:11:57 AM
// Design Name: 
// Module Name: PCSIM
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


module PCSIM();
    logic [9:0] DIN;
    logic PC_LD,PC_INC,RST,CLK;
    logic [9:0] PC_COUNT;
    PC PC_inst(.*);
    always 
    begin
       CLK=1;#5;
       CLK=0;#5;
    end
    initial
    begin
    DIN=0;
    PC_LD=0;
    RST=1;
    PC_INC=0;
    #10;
    //checks if the reset works
    
    RST = 0;
    PC_LD=1;
    DIN=10;
    PC_INC=1;
    #10;
    //checks if the load works; loads in A; also checks for priority of load over increment
    PC_LD = 0;
    PC_INC=1;
    #10;
    //checks if it increments
    
    PC_LD=1;
    PC_INC=1;
    DIN=10;
    RST=1;      //checks if the reset has higher priority
    end
    
    
    
    
endmodule
