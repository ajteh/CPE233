`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2019 01:36:44 AM
// Design Name: 
// Module Name: Mux2
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


module Mux2#(parameter WIDTH = 1)
    (input [WIDTH-1:0]  ai,bi,
     input         seli,
     output logic [WIDTH-1:0]muxo
    );
    
    always_comb
    begin
        case(seli)
            0:muxo = ai;
            1:muxo = bi;
            default:muxo = 0;
        endcase
    end
endmodule
