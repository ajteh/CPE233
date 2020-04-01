`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2019 10:43:19 PM
// Design Name: 
// Module Name: KeyPadSim
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


module KeyPadSim();
    logic CLK = 0, Interrupt, B,F,G,D;
    logic [3:0] ANODES;
    logic [7:0] CATHODES;
    logic [2:0] COLS;
    
    KeyPad KeyPad(.*);
    
    always
    begin
        CLK = ~CLK; #5;
    end
    
    initial
    begin
    COLS = 3'b010;
    #5000000;
    COLS = 0;
    end
    
endmodule
