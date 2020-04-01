`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2019 08:06:27 PM
// Design Name: 
// Module Name: KeyPadInt
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


module KeyPadInt(
    input CLK,
    input Press,
    output logic Interrupt
    );
    logic RCO;
    logic PressL;
    
    
    KeyPadCount Count(.CLK(CLK),.A(),.Pulse(),.RCO());
    KeyPadReg Register(.CLK(CLK),.Press(Press),.LD(Press),.PressL(PressL));
endmodule
