`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 12:02:14 PM
// Design Name: 
// Module Name: C
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


module C(
    input FLG_C_SET,FLG_C_LD,FLG_C_CLR,C,CLK,
    output logic C_FLAG
    );
    
    always_ff@(posedge CLK)
    begin
        if (FLG_C_CLR)
            C_FLAG <= 0;
        else if (FLG_C_SET)
            C_FLAG <= 1;
        else if (FLG_C_LD)
            C_FLAG <= C;
        else
            C_FLAG <= C_FLAG;
    end
endmodule
