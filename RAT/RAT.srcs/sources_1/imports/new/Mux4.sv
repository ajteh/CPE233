`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2019 12:51:03 AM
// Design Name: 
// Module Name: Mux4
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


module Mux4 #(parameter WIDTH = 10)
    (input [WIDTH-1:0]  ai, bi, ci, di,
     input [1:0]        seli,
     output logic [WIDTH-1:0] muxo);
    
    always_comb
    begin
        case(seli)
            0: muxo = ai;
            1: muxo = bi;
            2: muxo = ci;
            3: muxo = di;
            default:muxo = 0;
        endcase
    end
endmodule