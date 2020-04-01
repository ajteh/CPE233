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
    input logic CLK,RESET,INT,
    output logic IO_STRB,
    input logic [7:0] IN_PORT,
    output logic [7:0] OUT_PORT,PORT_ID
    );
    
    logic C_FLAG,RST,PC_LD, PC_INC,RF_WR;
    logic [9:0]t3,t4,t11,t15;
    logic [17:0]t1;
    logic [7:0] t5,t6,t7,t14,t8,t9,t12,t16;
    logic [1:0]RF_WR_SEL,SCR_ADDR_SEL,PC_MUX_SEL;
    logic [3:0] ALU_SEL;
    logic C,Z, t10,FLG_C_CLR,Z_FLAG,FLG_Z_LD,FLG_C_SET,FLG_C_LD,SCR_DATA_SEL,SCR_WE,SP_LD,SP_INCR,SP_DECR,ALU_OPY_SEL,Interrupt,I_CLR,I_SET,INT1,INT2,FLG_LD_SEL,FLG_SHAD_LD;


    
    Mux4 #10 PC_MUX(.ai(t1[12:3]),.bi(t15),.ci(10'b1111111111),.di(0), .seli(PC_MUX_SEL),.muxo(t3)); 
    ProgramCounter ProgramCounter(.DIN(t3),.CLK(CLK),.RST(RST),.PC_LD(PC_LD),.PC_INC(PC_INC),.PC_COUNT(t4));
    ProgRom ProgRom(.PROG_ADDR(t4),.PROG_CLK(CLK), .PROG_IR(t1));
    REG_FILE REG_FILE(.ADRX(t1[12:8]),.ADRY(t1[7:3]),.CLK(CLK),.RF_WR(RF_WR),.DIN(t5),.DX_OUT(t6),.DY_OUT(t7));
    
    Mux4#8 RF_WR_MUX(.ai(t8), .bi(t15[7:0]),.ci(t12),.di(IN_PORT), .seli(RF_WR_SEL),.muxo(t5));
    Mux2#8 ALU_OPY_MUX(.ai(t7),.bi(t1[7:0]),.seli(ALU_OPY_SEL),.muxo(t9));
    Mux2#10SCR_DATA_MUX(.ai({2'b00,t6}),.bi(t4),.seli(SCR_DATA_SEL),.muxo(t11));
    SCR_ADDR_MUX SCR_ADDR_MUX(.ai(t7),.bi(t1[7:0]),.ci(t12),.seli(SCR_ADDR_SEL),.SCR_ADDR(t14));
    ALU ALU(.SEL(ALU_SEL),.A(t6),.B(t9),.CIN(C_FLAG),.RESULT(t8),.C(C),.Z(Z));
    
//    C C_Flag(.C(C),.CLK(CLK),.FLG_C_LD(FLG_C_LD),.FLG_C_SET(FLG_C_SET),.FLG_C_CLR(FLG_C_CLR),.C_FLAG(C_FLAG));
//    Z Z_Flag(.Z(Z),.CLK(CLK), .FLG_Z_LD(FLG_Z_LD),.Z_FLAG(Z_FLAG));
    
    Flags Flags(.C(C),.Z(Z),.CLK(CLK),.FLG_C_LD(FLG_C_LD),.FLG_Z_LD(FLG_Z_LD),.FLG_C_SET(FLG_C_SET),.FLG_C_CLR(FLG_C_CLR),.Z_FLAG(Z_FLAG),.C_FLAG(C_FLAG),.FLG_SHAD_LD(FLG_SHAD_LD),.FLG_LD_SEL(FLG_LD_SEL));
    
    SCRATCH_RAM SCRATCH_RAM(.DATA_IN(t11),.SCR_WE(SCR_WE),.CLK(CLK),.SCR_ADDR(t14),.DATA_OUT(t15));
    StackPointer SP(.CLK(CLK),.RST(RST),.SP_LD(SP_LD),.SP_INCR(SP_INCR),.SP_DECR(SP_DECR),.DIN(t6),.SP_DOUT(t12));
    
    I I(.CLK(CLK),.I_SET(I_SET),.I_CLR(I_CLR),.OUT(INT1));
//    debounce_one_shot debounce_one_shot(.CLK(CLK),.BTN(INT),.DB_BTN(INT2));
    
    Control_Unit controlunit_inst(.C_FLAG(C_FLAG),.Z_FLAG(Z_FLAG),.RESET(RESET),.OPCODE_HIGH(t1[17:13])
                                      ,.OPCODE_LO(t1[1:0]),.CLK(CLK),.RST(RST),.PC_LD(PC_LD),.PC_INC(PC_INC)
                                      ,.PC_MUX_SEL(PC_MUX_SEL),.ALU_OPY_SEL(ALU_OPY_SEL),.ALU_SEL(ALU_SEL)
                                      ,.FLG_C_SET(FLG_C_SET),.FLG_C_CLR(FLG_C_CLR),.FLG_C_LD(FLG_C_LD),.FLG_Z_LD(FLG_Z_LD)
                                      ,.IO_STRB(IO_STRB),.RF_WR(RF_WR),.RF_WR_SEL(RF_WR_SEL),.SCR_ADDR_SEL(SCR_ADDR_SEL)
                                      ,.SCR_DATA_SEL(SCR_DATA_SEL),.SCR_WE(SCR_WE),.SP_LD(SP_LD),.SP_INCR(SP_INCR),.SP_DECR(SP_DECR),.INT(Interrupt),.I_SET(I_SET)
                                      ,.I_CLR(I_CLR),.FLG_SHAD_LD(FLG_SHAD_LD),.FLG_LD_SEL(FLG_LD_SEL));   
                                      
    assign OUT_PORT = t6;   
    assign PORT_ID = t1[7:0];
    assign Interrupt = INT & INT1;
endmodule
