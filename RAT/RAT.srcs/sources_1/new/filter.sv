`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 07:14:52 PM
// Design Name: 
// Module Name: filter
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


module filter(
    input clk,
    input [7:0] scancode,
    output logic compare
    );
    logic [7:0]previous;
    
    always_ff@(posedge clk)
    begin
        previous = scancode;
    end
    
    assign compare = (scancode != previous);
endmodule
