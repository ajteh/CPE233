`timescale 1ns / 1ps
//////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2019 08:06:58 PM
// Design Name: 
// Module Name: MCU SIM
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
/////////////////////////////////////////


module MCU_SIM();
    logic CLK = 0,RESET = 0;
    logic [7:0] IN_PORT = 0,OUT_PORT,PORT_ID;
    logic IO_STRB;
    
    RAT_MCU RAT(.*);
    
    always
    begin
        CLK = ~CLK; #5;
    end
    
    initial
    begin
    
    RESET = 1; #10;
    RESET = 0;
       
      
    end
    
endmodule
