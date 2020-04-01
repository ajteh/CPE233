`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2019 09:55:24 PM
// Design Name: 
// Module Name: SCR_ADDR_MUX
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


module SCR_ADDR_MUX(
    input [7:0] ai,bi,ci,
    input [1:0] seli,    
    output logic [7:0] SCR_ADDR);
    
    always_comb
    begin
        case(seli)
            0:SCR_ADDR = ai;
            1:SCR_ADDR = bi;
            2:SCR_ADDR = ci;
            3:SCR_ADDR = ci-1;
        endcase
//        if (SCR_ADDR_SEL == 2'b00)
//            SCR_ADDR = DY_OUT;
            
//        else if (SCR_ADDR_SEL == 2'b01)
//            SCR_ADDR = IR_IMM;
            
//        else if (SCR_ADDR_SEL == 2'b10)
//            SCR_ADDR = SP_DATA_OUT;
            
//        else if (SCR_ADDR_SEL == 2'b11)
//            SCR_ADDR = SP_DATA_OUT - 1;
//        else
//            SCR_ADDR = SCR_ADDR;
    end
    
endmodule
