`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2019 09:05:37 PM
// Design Name: 
// Module Name: Flags
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


module Flags(
    input CLK,FLG_SHAD_LD,FLG_Z_LD,FLG_LD_SEL,FLG_C_SET,FLG_C_LD,FLG_C_CLR,C,Z,
    output Z_FLAG,C_FLAG
    );
    logic CM1,ZM1,Z_IN,C_IN,ZF,CF;
    
    C C_Flag(.C(C_IN),.CLK(CLK),.FLG_C_LD(FLG_C_LD),.FLG_C_SET(FLG_C_SET),.FLG_C_CLR(FLG_C_CLR),.C_FLAG(CF));
    Z Z_Flag(.Z(Z_IN),.CLK(CLK),.FLG_Z_LD(FLG_Z_LD),.Z_FLAG(ZF));
    SHAD_C SHAD_C(.CLK(CLK),.LD(FLG_SHAD_LD),.IN(C_IN),.OUT(CM1));
    SHAD_Z SHAD_Z(.CLK(CLK),.LD(FLG_SHAD_LD),.IN(Z_IN),.OUT(ZM1));
    Mux2 CMux(.ai(C),.bi(CM1),.seli(FLG_LD_SEL),.muxo(C_IN));
    Mux2 ZMux(.ai(Z),.bi(ZM1),.seli(FLG_LD_SEL),.muxo(Z_IN));

    assign Z_FLAG = ZF;
    assign C_FLAG = CF;
endmodule
