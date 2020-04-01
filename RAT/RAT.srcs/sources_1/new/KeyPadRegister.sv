`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2019 11:49:52 AM
// Design Name: 
// Module Name: KeyPadRegister
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


module KeyPadRegister(
    input CLK,LD,
    input [3:0] D,
    output logic [3:0] Q
    );
    
    always_ff @(posedge CLK)
    begin
        if (LD)
            Q <= D;
    end
endmodule
