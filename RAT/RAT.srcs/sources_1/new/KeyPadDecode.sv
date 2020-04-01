`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2019 03:55:33 PM
// Design Name: 
// Module Name: KeyPadDecode
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


module KeyPadDecode(
    input [4:0]DATA,
    output logic [4:0]DOUT
    );
    
    always_comb
    begin
    case(DATA)
        1:DOUT = 1;
        2:DOUT = 2;
        3:DOUT = 3;
        4:DOUT = 4;
        5:DOUT = 5;
        6:DOUT = 6;
        7:DOUT = 7;
        8:DOUT = 8;
        9:DOUT = 9;
        10:DOUT = 10;
        11:DOUT = 0;
        12:DOUT = 11;
        default: DOUT = 0;
    endcase
    end
endmodule
