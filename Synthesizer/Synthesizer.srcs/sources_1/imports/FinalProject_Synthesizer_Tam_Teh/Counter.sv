`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2019 11:12:24 AM
// Design Name: 
// Module Name: Counter
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


module Counter(
    input clk,RST, 
    input [7:0]Data,
    output logic [7:0]out
    );
    
    logic [31:0] count = 25000000;
    
    //This always_ff block counts down for the watchdog timer
    //Count to 10000000 tuned by guess and check for the keypress
    always_ff@(posedge clk) 
    begin
        if (RST)
            count <= 25000000;
        else if (count != 0)
            count <= count - 1;
    end
    
    //If the count is 0 then allow the speaker signal to pass
    always_comb
    begin
        if (count == 0)
            out = 0;
        else
            out = Data;
    end
endmodule
