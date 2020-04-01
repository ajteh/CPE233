`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2019 08:39:13 PM
// Design Name: 
// Module Name: KeyPadEN
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


module KeyPadEN(
    input Press,RST,
    output logic EN
    );
    
    always_ff @(negedge Press)
    begin
        EN <= 1;
    end
    
    always_comb
    begin
        if (RST);
            EN = 0;
    end
    
endmodule
