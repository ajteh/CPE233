`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2019 10:06:00 PM
// Design Name: 
// Module Name: CONTROLLLLLLUNIT
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


module CONTROLLLLLLLUNIT(C, Z, INT_SIG, RESET, OPCODE_HI_5, OPCODE_LO_2, CLK,
                    I_SET, I_CLR, PC_LD, PC_INC, PC_MUX_SEL, ALU_OPY_SEL,
                    ALU_SEL, RF_WR, RF_WR_SEL, SP_LD, SP_INCR, SP_DECR,
                    SCR_WE, SCR_ADDR_SEL, SCR_DATA_SEL, FLG_C_SET, FLG_C_CLR,
                    FLG_C_LD, FLG_Z_LD, FLG_LD_SEL, FLG_SHAD_LD, RST, IO_STRB);
    input       C;
    input       Z;
    input       INT_SIG; // labeled as just INT on the architecture
    input       RESET;
    input [4:0] OPCODE_HI_5;
    input [1:0] OPCODE_LO_2;
    input       CLK;
    
    output logic        I_SET;
    output logic        I_CLR;
    
    output logic        PC_LD;
    output logic        PC_INC;
    output logic [1:0]  PC_MUX_SEL;
    
    output logic        ALU_OPY_SEL;
    output logic [3:0]  ALU_SEL;
    
    output logic        RF_WR;
    output logic [1:0]  RF_WR_SEL;
    
    output logic        SP_LD;
    output logic        SP_INCR;
    output logic        SP_DECR;
    
    output logic        SCR_WE;
    output logic [1:0]  SCR_ADDR_SEL;
    output logic        SCR_DATA_SEL;

    output logic        FLG_C_SET;
    output logic        FLG_C_CLR;
    output logic        FLG_C_LD;
    output logic        FLG_Z_LD;
    output logic        FLG_LD_SEL;
    output logic        FLG_SHAD_LD;
    
    output logic       RST;
    
    output logic       IO_STRB;
    
    logic [1:0] NS, PS;
    parameter [1:0] ST_INIT = 2'b00;
    parameter [1:0] ST_FETCH = 2'b01;
    parameter [1:0] ST_EX = 2'b10;
    
    always_ff @ (posedge CLK)
    begin
        if (RESET == 1)
            PS <= ST_INIT;
    
        else
            PS <= NS;
    end
    
    always_comb
    begin
        I_SET = 1'h0;
        I_CLR = 1'h0;
        
        PC_LD = 1'h0;
        PC_INC = 1'h0;
        PC_MUX_SEL = 2'h0;
        
        ALU_OPY_SEL = 1'h0;
        ALU_SEL = 4'h0;
        
        RF_WR = 1'h0;
        RF_WR_SEL = 2'h0;
        
        SP_LD = 1'h0;
        SP_INCR = 1'h0;
        SP_DECR = 1'h0;
        
        SCR_WE = 1'h0;
        SCR_ADDR_SEL = 2'h0;
        SCR_DATA_SEL = 1'h0;
        
        FLG_C_SET = 1'h0;
        FLG_C_CLR = 1'h0;
        FLG_C_LD = 1'h0;
        FLG_Z_LD = 1'h0;
        FLG_LD_SEL = 1'h0;
        FLG_SHAD_LD = 1'h0;
        
        RST = 1'h0;
        
        IO_STRB = 1'h0;
        
        case(PS)
            ST_INIT:
            begin
                NS = ST_FETCH;
                RST = 1'h1;
            end
            
            ST_FETCH:
            begin
                NS = ST_EX;
                RST = 1'h0;
                PC_INC = 1'h1;
            end
            
            ST_EX:
            begin
                NS = ST_FETCH;
                case({OPCODE_HI_5, OPCODE_LO_2})
                //  Case is the 5 bit high opcode + 7 bit lowcode
                //  For those where 2bit lowcode doesn't matter, you have to put 00, 01, 10, and 11 in condition
                //  For those where 2bit lowcode does matter, just include it in the condition
                //  Below are how I called the reg-imm and reg-reg form for TEST
                    
                    // ADD reg-reg ----------------------------------------
                    7'b00001_00: 
                    begin
                        ALU_SEL = 4'b0000;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end
                    
                    // ADD reg-imm -----------------------------------------
                    7'b10100_00, 7'b10100_01, 7'b10100_10, 7'b10100_11: 
                    begin
                        ALU_SEL = 4'b0000;
                        ALU_OPY_SEL = 1'b1;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end
                    
                    // ADDC reg-reg -------------------------------------------
                    7'b00001_01: 
                    begin
                        ALU_SEL = 4'b0001;
                        ALU_OPY_SEL = 1'b0;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end                    
                    
                    // ADDC reg-imm ---------------------------------------
                    7'b10101_00, 7'b10101_01, 7'b10101_10, 7'b10101_11: 
                    begin
                        ALU_SEL = 4'b0001;
                        ALU_OPY_SEL = 1'b1;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end 
                    
                    // AND reg-reg -----------------------------------------
                    7'b00000_00: 
                    begin
                        ALU_SEL = 4'b0101;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_CLR = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end
                    
                    // AND reg-imm ----------------------------------------
                    7'b10000_00, 7'b10000_01, 7'b10000_10, 7'b10000_11: 
                    begin
                        ALU_SEL = 4'b0101;
                        ALU_OPY_SEL = 1'b1;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_CLR = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end                      
                    
                    // ASR -------------------------------------------
                    7'b01001_00: 
                    begin
                        ALU_SEL = 4'b1101;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;                    
                    end
                    
                    // BRCC ---------------------------------------
                    7'b00101_01:
                    begin
                        PC_LD = ~C;
                        PC_MUX_SEL = 2'b00;
                    end
                    
                    // BRCS -------------------------------------------
                    7'b00101_00: 
                    begin
                        PC_LD = C;
                        PC_MUX_SEL = 2'b00;
                    end
                    
                    // BREQ ------------------------------------------
                    7'b00100_10: 
                    begin
                        PC_LD = Z;
                        PC_MUX_SEL = 2'b00;
                    end
                    
                    // BRN -------------------------------------------                    
                    7'b00100_00: 
                    begin
                        PC_MUX_SEL = 2'b00;
                        PC_LD = 1'b1;
                    end
                    
                    // BRNE ----------------------------------------------
                    7'b00100_11: 
                    begin
                        PC_LD = ~Z;
                        PC_MUX_SEL = 2'b00;
                    end
                    
                    // Call -----------------------------------------------
                    7'b00100_01:
                    begin
                        SCR_ADDR_SEL = 2'b11;
                        SCR_DATA_SEL = 1'b1;
                        SCR_WE = 1'b1;
                        SP_DECR = 1'b1;
                        PC_MUX_SEL = 2'b00;
                        PC_LD = 1'b1;
                    end
                    
                    // CLC -------------------------------------------------
                    7'b01100_00: 
                    begin
                        FLG_C_CLR = 1'b1;                     
                    end
                    
                    // CMP reg-reg ------------------------------------------
                    7'b00010_00: 
                    begin
                        ALU_SEL = 4'b0100;
                        ALU_OPY_SEL = 1'b0;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end
                    
                    // CMP reg-imm ----------------------------------------
                    7'b11000_00, 7'b11000_01, 7'b11000_10, 7'b11000_11: 
                    begin
                        ALU_SEL = 4'b0100;
                        ALU_OPY_SEL = 1'b1;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end                    
                    
                    // EXOR REG-REG -----------------------------------                                    
                    7'b00000_10: 
                    begin
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        ALU_SEL = 4'b0111;
                        ALU_OPY_SEL = 1'b0;
                        FLG_C_CLR = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end
                    
                    // EXOR REG-IMM ---------------------------------------
                    7'b10010_00, 7'b10010_01, 7'b10010_10, 7'b10010_11: 
                    begin
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        ALU_SEL = 4'b0111;
                        ALU_OPY_SEL = 1'b1;
                        FLG_C_CLR = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end                       
                    
                    // IN --------------------------------------------------
                    7'b11001_00, 7'b11001_01, 7'b11001_10, 7'b11001_11: 
                    begin
                        RF_WR_SEL = 2'b11;
                        RF_WR = 1'b1;                     
                    end
                    
                    // LD reg-reg --------------------------------------------
                    7'b00010_10:
                    begin
                        SCR_ADDR_SEL = 2'b00;
                        SCR_WE = 1'b1;
                        RF_WR_SEL = 2'b01;
                        RF_WR = 1'b1;
                    end
                    
                    // LD reg-imm --------------------------------------------
                    7'b11100_00, 7'b11100_01, 7'b11100_10, 7'b11100_11:
                    begin
                        SCR_ADDR_SEL = 2'b01;
                        SCR_WE = 1'b1;
                        RF_WR_SEL = 2'b01;
                        RF_WR = 1'b1;
                    end
                    
                    // LSL ----------------------------------------------
                    7'b01000_00: 
                    begin
                        ALU_SEL = 4'b1001;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end                    
                    
                    // LSR -------------------------------------------------
                    7'b01000_01: 
                    begin
                        ALU_SEL = 4'b1010;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end                                                      
                    
                    // MOV reg-reg ----------------------------------------
                    7'b00010_01: 
                    begin
                        ALU_SEL = 4'b1110;
                        ALU_OPY_SEL = 1'b0;
                        RF_WR_SEL = 2'b00;
                        RF_WR = 1'b1;
                    end
                    
                    // MOV reg-imm --------------------------------------
                    7'b11011_00, 7'b11011_01, 7'b11011_10, 7'b11011_11: 
                    begin
                        ALU_SEL = 4'b1110;
                        ALU_OPY_SEL = 1'b1;
                        RF_WR_SEL = 2'b00;
                        RF_WR = 1'b1;                    
                    end
                    
                    // OR reg-reg ---------------------------------------
                    7'b00000_01: 
                    begin
                        ALU_SEL = 4'b0110;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_CLR = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end
                                        
                    // OR reg-imm ----------------------------------------             
                    7'b10001_00, 7'b10001_01, 7'b10001_10, 7'b10001_11: 
                    begin
                        ALU_SEL = 4'b0110;
                        ALU_OPY_SEL = 1'b1;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_CLR = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end
                    
                    // OUT ----------------------------------------------
                    7'b11010_00, 7'b11010_01, 7'b11010_10, 7'b11010_11: 
                    begin
                        IO_STRB = 1'b1;
                    end
                    
                    // POP --------------------------------------------------
                    7'b01001_10:
                    begin
                        SP_INCR = 1'b1;
                        RF_WR_SEL = 2'b01;
                        RF_WR = 1'b1;
                        SCR_ADDR_SEL = 2'b10;
                        SCR_WE = 1'b0;
                        SCR_DATA_SEL = 1'b0;
                    end
                    
                    // PUSH ---------------------------------------------------
                    7'b01001_01:
                    begin
                        SCR_DATA_SEL = 1'b0;
                        SCR_WE = 1'b1;
                        SCR_ADDR_SEL = 2'b11;
                        SP_DECR = 1'b1;
                    end
                    
                    // RET ----------------------------------------------------
                    7'b01100_10:
                    begin
                        PC_MUX_SEL = 2'b01;
                        PC_LD = 1'b1;
                        SP_INCR = 1'b1;
                        SCR_ADDR_SEL = 2'b10;
                    end
                    
                    // ROL ----------------------------------------------------
                    7'b01000_10:
                     begin
                        ALU_SEL = 4'b1011;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                     end
                    
                    // ROR ---------------------------------------------------
                    7'b01000_11:
                    begin
                        ALU_SEL = 4'b1100;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1'b1;
                        FLG_Z_LD = 1'b1;
                    end
                    
                    // SEC ---------------------------------------------------
                    7'b01100_01:
                    begin
                        FLG_C_SET = 1'b1;
                    end
                    
                    // ST reg-reg ------------------------------------------------
                    7'b00010_11:
                    begin
                        SCR_DATA_SEL = 1'b0;
                        SCR_ADDR_SEL = 2'b00;
                        SCR_WE = 1'b1;
                    end
                    // ST reg-imm -------------------------------------------------
                    7'b11101_00, 7'b11101_01, 7'b11101_10, 7'b11101_11:
                    begin
                       SCR_DATA_SEL = 1'b0;
                       SCR_ADDR_SEL = 2'b01;
                       SCR_WE = 1'b1;
                    end                 
                      
                    // SUB reg-reg ----------------------------------------------
                    7'b00001_10: 
                    begin
                        ALU_SEL = 4'b0010;
                        ALU_OPY_SEL = 1'b0;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                    end
                    
                    // SUB reg-imm ------------------------------------------------
                    7'b10110_00, 7'b10110_01, 7'b10110_10, 7'b10110_11: 
                    begin
                        ALU_SEL = 4'b0010;
                        ALU_OPY_SEL = 1'b1;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                    end
                    
                    // SUBC reg-reg ---------------------------------------
                    7'b00001_11: 
                    begin
                        ALU_SEL = 4'b0011;
                        ALU_OPY_SEL = 1'b0;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                    end

                    // SUBC reg-imm ---------------------------------------
                    7'b10111_00, 7'b10111_01, 7'b10111_10, 7'b10111_11: 
                    begin
                        ALU_SEL = 4'b0011;
                        ALU_OPY_SEL = 1'b1;
                        RF_WR = 1'b1;
                        RF_WR_SEL = 2'b00;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                    end                                        
                   
                    // TEST REG-REG ---------------------------------------
                    7'b00000_11: 
                    begin
                        ALU_SEL = 4'b1000;
                        ALU_OPY_SEL = 1'b0;
                        FLG_C_CLR = 1;
                        FLG_Z_LD = 1;
                    end
                    
                    // TEST REG-IMM -----------------------------------------
                    7'b10011_00, 7'b10011_01, 7'b10011_10, 7'b10011_11: 
                    begin
                        ALU_SEL = 4'b1000;
                        ALU_OPY_SEL = 1'b1;
                        FLG_C_CLR = 1;
                        FLG_Z_LD = 1;
                    end
                    
                    // WSP -----------------------------------------------
                    7'b01010_00:
                    begin
                        SP_LD = 1'b1;
                    end
                                                               
                default : NS = ST_INIT;
                endcase
            end
        default : NS = ST_INIT;
        endcase
    end
endmodule

