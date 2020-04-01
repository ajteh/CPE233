`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2019 11:57:39 AM
// Design Name: 
// Module Name: KeyPadIntGen
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


module KeyPadIntGen(
    input CLK, EN,
    output logic Pulse, RST = 0
    );
    logic [2:0] count;
    always_ff @(posedge CLK)
    begin
        if (EN)
        begin
            Pulse <= 1;
            count += 1;
        end
        if (count == 6)
        begin
            RST <= 1;
            count <= 0;
            Pulse <= 0;
        end
        
    end
endmodule
