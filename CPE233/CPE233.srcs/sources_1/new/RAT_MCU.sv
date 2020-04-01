`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 01:27:58 PM
// Design Name: 
// Module Name: RAT_MCU
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


module RAT_MCU(
    input logic CLK,RESET,//INT,
    output logic IO_STRB,
    input logic [7:0] IN_PORT,
    output logic [7:0] OUT_PORT,PORT_ID
    );
    
    logic C_FLAG,RST;
    logic [9:0]t3; 
    logic PC_LD, PC_INC;
    logic [9:0] t4;
    logic [17:0]t1;
    logic RF_WR;
    logic [7:0] t5,t6,t7;
    logic [2:0]PC_MUX_SEL;
    logic [7:0]t8,t9;
    logic [1:0]RF_WR_SEL;
    logic ALU_OPY_SEL;
    logic [3:0] ALU_SEL;
    logic C,Z, t10;
    logic FLG_C_CLR;
    logic Z_FLAG, FLG_Z_LD;
    logic FLG_C_SET,FLG_C_LD;

    
    Mux4 #10 Mux0(.ai(t1[12:3]),.bi(),.ci(10'b1111111111),.di(0), .seli(PC_MUX_SEL),.muxo(t3)); 
    ProgramCounter ProgramCounter(.DIN(t3),.CLK(CLK),.RST(RST),.PC_LD(PC_LD),.PC_INC(PC_INC),.PC_COUNT(t4));
    ProgRom ProgRom(.PROG_ADDR(t4),.PROG_CLK(CLK), .PROG_IR(t1));
    REG_FILE REG_FILE(.ADRX(t1[12:8]),.ADRY(t1[7:3]),.CLK(CLK),.RF_WR(RF_WR),.DIN(t5),.DX_OUT(t6),.DY_OUT(t7));
    
    Mux4#8 Mux1(.ai(t8), .bi(0),.ci(0),.di(IN_PORT), .seli(RF_WR_SEL),.muxo(t5));
    Mux2#8 Mux2(.ai(t7),.bi(t1[7:0]),.seli(ALU_OPY_SEL),.muxo(t9));
    ALU ALU(.SEL(ALU_SEL),.A(t6),.B(t9),.CIN(t10),.RESULT(t8),.C(C),.Z(Z));
    
    C C_Flag(.C(C),.CLK(CLK),.FLG_C_CLR(FLG_C_CLR),.C_FLAG(C_FLAG));
    Z Z_Flag(.Z(Z),.CLK(CLK), .FLG_Z_LD(FLG_Z_LD),.Z_FLAG(Z_FLAG));
    
    Control_Unit controlunit_inst(.C_FLAG(C_FLAG),.Z_FLAG(Z_FLAG),.RESET(RESET),.OPCODE_HIGH(t1[17:13]),.OPCODE_LO(t1[1:0]),.CLK(CLK),.RST(RST),.PC_LD(PC_LD),.PC_INC(PC_INC),.PC_MUX_SEL(PC_MUX_SEL),.ALU_OPY_SEL(ALU_OPY_SEL),.ALU_SEL(ALU_SEL),.FLG_C_SET(FLG_C_SET),.FLG_C_CLR(FLG_C_CLR),.FLG_C_LD(FLG_C_LD),.FLG_Z_LD(FLG_Z_LD),.IO_STRB(IO_STRB),.RF_WR(RF_WR),.RF_WR_SEL(RF_WR_SEL));    
    
    assign OUT_PORT = t6;   
    assign PORT_ID = t1[7:0];
endmodule
