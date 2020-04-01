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
    logic CLK = 0,BTNC = 0,BTNL,PS2CLK = 1,SPEAKER,TEST;
    logic [7:0] CATHODES,LEDS,SWITCHES = 0,PS2DATA = 8'h22;
    logic [3:0] ANODES;
//    logic IO_STRB;
    
    RAT_WRAPPER RAT(.*);
    
    always
    begin
        CLK = ~CLK; #5;
    end
       
    initial
    begin

    BTNC = 1; #10;
    BTNC = 0; #5000;
    
//    BTNL = 1; #20;
//    BTNL = 0; #20;   
//    BTNL = 1; #20;
//    BTNL = 0; #20;
//    BTNL = 1; #20;
//    BTNL = 0; #20;   
//    BTNL = 1; #20;
//    BTNL = 0; #20;  
//    BTNL = 1; #20;
//    BTNL = 0; #20;   
//    BTNL = 1; #20;
//    BTNL = 0; #20;
        
        
    end
    
endmodule
