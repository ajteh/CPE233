`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aaron Teh
// 
// Create Date: 10/11/2018 01:28:57 PM
// Design Name: 
// Module Name: Mux
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



module Mux #(parameter WIDTH = 10 )
            (input[WIDTH-1:0]   FROM_IMMED,FROM_STACK,
             input[1:0]         PC_MUX_SEL,
             output logic [WIDTH-1:0] DIN );


        always @(PC_MUX_SEL)
        begin
        case (PC_MUX_SEL)
            0 : DIN = FROM_IMMED;
            1 : DIN = FROM_STACK;
            2 : DIN = 10'h3FF;
            3 : DIN = 10'h0;
            default : DIN = 10'h0;
        endcase
    end

endmodule
