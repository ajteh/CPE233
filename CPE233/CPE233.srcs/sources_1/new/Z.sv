`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 12:29:34 AM
// Design Name: 
// Module Name: Z
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


module Z(
    input Z,CLK,FLG_Z_LD,
    output logic Z_FLAG
    );
    
    always_ff@(posedge CLK)
    begin
        if (FLG_Z_LD)
            Z_FLAG <= Z;
    end
endmodule
