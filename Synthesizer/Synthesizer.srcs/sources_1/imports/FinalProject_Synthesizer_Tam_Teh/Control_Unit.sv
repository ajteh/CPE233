`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2019 04:16:33 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input C_FLAG,Z_FLAG,INT,RESET,CLK,
    input [1:0]OPCODE_LO,
    input [4:0]OPCODE_HIGH,
    output logic RST,I_SET,I_CLR,PC_LD,PC_INC,ALU_OPY_SEL,RF_WR,SP_LD,SP_INCR,SP_DECR,SCR_WE,SCR_DATA_SEL,FLG_C_SET,FLG_C_CLR,FLG_C_LD,FLG_Z_LD,FLG_LD_SEL,FLG_SHAD_LD,IO_STRB,
    output logic[1:0]RF_WR_SEL,PC_MUX_SEL,SCR_ADDR_SEL,
    output logic[3:0]ALU_SEL
    );
    
    typedef enum{ST_FETCH,ST_EXECUTE,ST_INIT,INTERRUPT}States;
    States NS,PS = ST_INIT;
    
    always_ff@(posedge CLK/*, posedge INT*/)
    begin
        if (RESET)
            PS <= ST_INIT;
//        else if (INT)
//            PS <= INTERRUPT;
        else
            PS <= NS;
    end
    
    always_comb
    begin
        NS = ST_INIT;
        RST = 0;
        RF_WR_SEL = 0;
        PC_INC = 0;
        PC_LD = 0;
        PC_MUX_SEL = 0;
        RF_WR = 0;
        RF_WR_SEL = 0;
        FLG_C_SET = 0;
        FLG_C_CLR = 0;
        FLG_C_LD = 0;
        FLG_Z_LD = 0;
        FLG_LD_SEL = 0;
        ALU_SEL = 0;
        ALU_OPY_SEL = 0;
        SP_LD = 0;
        SP_INCR = 0;
        SP_DECR = 0;
        SCR_DATA_SEL = 0;
        SCR_WE = 0;
        SCR_ADDR_SEL = 0;
        IO_STRB = 0;
        I_SET = 0;
        I_CLR = 0;
        FLG_LD_SEL = 0;
        FLG_SHAD_LD = 0;
        case(PS)
            ST_INIT:
            begin
                NS = ST_FETCH;
                PC_INC = 0;
                PC_LD = 1;
                RST = 1;
                PC_MUX_SEL = 3;
            end
            ST_FETCH:
            begin
                NS = ST_EXECUTE;
                RF_WR = 0;
                PC_LD = 0;
                RST = 0;
                PC_INC = 1;
                IO_STRB = 0;
            end
            INTERRUPT:
            begin
                I_CLR = 1;
                PC_LD = 1;
                PC_MUX_SEL = 2;
                SCR_WE = 1;
                SP_DECR = 1;
                SCR_DATA_SEL = 1;
                SCR_ADDR_SEL = 3;
                NS = ST_FETCH;
                FLG_SHAD_LD = 1;
            end
            ST_EXECUTE:
            begin
                NS = ST_FETCH;
                PC_INC = 0;
                if (INT)
                    NS = INTERRUPT;
                else
                    NS = ST_FETCH;
                case({OPCODE_HIGH,OPCODE_LO})
                    7'b0000010:                                     //EXOR REG
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 1;
                        FLG_C_LD = 0;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 7;
                    end
                    7'b1101100,7'b1101101,7'b1101110,7'b1101111:    //MOV IMM
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 0;
                        FLG_Z_LD = 0;
                        ALU_OPY_SEL = 1;
                        ALU_SEL = 14;
                    end
                    7'b1100100,7'b1100101,7'b1100110,7'b1100111:    //IN
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        IO_STRB = 0;
                        RF_WR_SEL = 3;
                        RF_WR = 1;
                    end
                    7'b1101000,7'b1101001,7'b1101010,7'b1101011:    //OUT
                    begin
                        IO_STRB = 1;
                        RF_WR_SEL = 0;
                        RF_WR = 0;
                    end
                    7'b0010000:                                     //BRN
                    begin
                        PC_LD = 1;
                        PC_MUX_SEL = 0;
                    end
                    7'b1010000, 7'b1010001, 7'b1010010, 7'b1010011: //ADD IMM
                    begin
                        ALU_SEL = 0;
                        ALU_OPY_SEL = 1;
                        RF_WR_SEL = 0;
                        RF_WR = 1;
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        FLG_LD_SEL = 0;
//                        FLG_SHAD_LD = 0;
                    end
                    7'b1010100,7'b1010101,7'b1010110,7'b1010111:    //ADDC IMM
                    begin
                        ALU_SEL = 1;
                        ALU_OPY_SEL = 1;
                        RF_WR_SEL = 0;
                        RF_WR = 1;
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                    end
                    7'b1011000,7'b1011001,7'b1011010,7'b1011011:     //SUB IMM
                    begin
                        ALU_SEL = 2;
                        ALU_OPY_SEL = 1;
                        RF_WR_SEL = 0;
                        RF_WR = 1;
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                    end
                    7'b1011100,7'b1011101,7'b1011110,7'b1011111:    //SUBC IMM
                    begin
                        ALU_SEL = 3;
                        ALU_OPY_SEL = 1;
                        RF_WR_SEL = 0;
                        RF_WR = 1;
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                    end
                    7'b1100000,7'b1100001,7'b1100010,7'b1100011:    //CMP IMM
                    begin   
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 0;
                        RF_WR_SEL = 2;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 1;
                        ALU_SEL = 4;
                    end
                    7'b1000000,7'b1000001,7'b1000010,7'b1000011:    //AND IMM
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 1;
                        FLG_C_LD = 0;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 1;
                        ALU_SEL = 5;
                    end
                    7'b1000100,7'b1000101,7'b1000110,7'b1000111:    //OR IMM
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 1;
                        FLG_C_LD = 0;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 1;
                        ALU_SEL = 6;
                    end
                    7'b1001000,7'b1001001,7'b1001010,7'b1001011:    //EXOR IMM
                    begin  
                        PC_LD= 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 1;
                        FLG_C_LD = 0;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 1;
                        ALU_SEL = 7;
                    end
                    7'b1001100,7'b1001101,7'b1001110,7'b1001111:    //TEST IMM
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 0;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 1;
                        FLG_C_LD = 0;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 1;
                        ALU_SEL = 8;
                    end
                    7'b0100000:                                     //LSL
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 9;
                    end
                    7'b0100001:                                     //LSR
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 10;
                    end
                    7'b0100010:                                     //ROL
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 11;
                    end
                    7'b0100011:                                     //ROR
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 12;
                    end
                    7'b0100100:                                     //ASR
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 13;
                    end
                    7'b0000100:                                     //ADD REG
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 0;
                    end
                    7'b0000101:                                     //ADDC REG
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 1;
                    end
                    7'b0000110:                                     //SUB REG
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 2;
                    end
                    7'b0000111:                                     //SUBC REG
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 3;
                    end
                    7'b0001000:                                     //CMP REG
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 0;
                        RF_WR_SEL = 2;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 1;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 4;
                    end
                    7'b0000000:                                     //AND REG
                    begin
                        RF_WR = 1;
                        FLG_C_CLR = 1;
                        FLG_Z_LD = 1;
                        ALU_SEL = 5;
                    end
                    7'b0000001:                                     //OR REG
                    begin
                        RF_WR = 1;
                        FLG_C_CLR = 1;
                        FLG_Z_LD = 1;
                        ALU_SEL = 6;
                    end
                    7'b0000011:                                     //TEST REG
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 0;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 1;
                        FLG_C_LD = 0;
                        FLG_Z_LD = 1;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 8;
                    end
                    7'b0001001:                                     //MOV REG
                    begin
                        PC_LD = 0;
                        PC_MUX_SEL = 0;
                        RF_WR = 1;
                        RF_WR_SEL = 0;
                        FLG_C_SET = 0;
                        FLG_C_CLR = 0;
                        FLG_C_LD = 0;
                        FLG_Z_LD = 0;
                        ALU_OPY_SEL = 0;
                        ALU_SEL = 14;
                    end
                    7'b0110000:                                     //CLC
                    begin
                        FLG_C_CLR = 1;
                    end
                    7'b0110001:                                     //SEC      
                    begin
                        FLG_C_SET = 1;
                    end
                    7'b0010101:                                     //BRCC
                    begin
                        PC_MUX_SEL = 0;
                        PC_LD = ~C_FLAG;
                    end
                    7'b0010100:                                     //BRCS
                    begin
                        PC_MUX_SEL = 0;
                        PC_LD = C_FLAG;
                    end
                    7'b0010011:                                     //BRNE
                    begin
                        PC_MUX_SEL = 0;
                        PC_LD = ~Z_FLAG;
                    end
                    7'b0010010:                                     //BREQ
                    begin
                        PC_MUX_SEL = 0;
                        PC_LD = Z_FLAG;
                    end
                    7'b0010001:                                     //CALL
                    begin
                        SP_DECR = 1;
                        SCR_WE = 1;
                        PC_LD = 1;
                        SCR_ADDR_SEL = 3;
                        SCR_DATA_SEL = 1;
                    end
                    7'b1110000,7'b1110001,7'b1110010,7'b1110011:    //LD IMMED
                    begin
                        SCR_ADDR_SEL = 1;
//                        SCR_WE = 1;
                        RF_WR = 1;
                        RF_WR_SEL = 1;                                             
                    end
                    7'b1110100,7'b1110101,7'b1110110,7'b1110111:    //ST IMMED
                    begin
                        SCR_ADDR_SEL = 1;
                        SCR_WE = 1;
                        SCR_DATA_SEL = 0;
                    end
                    7'b0001010:                                     //LD REG
                    begin
//                        SCR_WE = 1;
                        RF_WR = 1;
                        RF_WR_SEL = 1;
                    end
                    7'b0001011:                                     //ST REG
                    begin
                        SCR_WE = 1;
                        SCR_ADDR_SEL = 0;
                        SCR_DATA_SEL = 0;                        
                    end
                    7'b0101000:                                     //WSP
                    begin
                        SP_LD = 1;                     
                    end
                    7'b0110010:                                     //RET
                    begin
                        PC_MUX_SEL = 1;
                        SP_INCR = 1;
                        SCR_ADDR_SEL = 2;
                        PC_LD = 1;                  
                    end
                    7'b0100101:                                     //PUSH
                    begin
                        SCR_WE = 1;
                        SCR_ADDR_SEL = 3;
                        SP_DECR = 1;
                    end
                    7'b0100110:                                     //POP
                    begin
                        RF_WR_SEL = 1;
                        RF_WR = 1;
                        SCR_ADDR_SEL = 2;
                        SP_INCR = 1;
                    end
                    7'b0110100:                                     //SEI
                    begin
                        I_SET = 1;
                    end
                    7'b0110101:                                     //CLI
                    begin
                        I_CLR = 1;
                    end
                    7'b0110110:                                     //RETID
                    begin
                        PC_LD = 1;
                        PC_MUX_SEL = 1;
                        I_CLR = 1;
                        SP_INCR = 1;
                        SCR_ADDR_SEL = 2;
                        FLG_LD_SEL = 1;
                        FLG_Z_LD = 1;
                        FLG_C_LD = 1;
                    end
                    7'b0110111:                                     //RETIE        
                    begin
                        PC_LD = 1;
                        PC_MUX_SEL = 1;
                        I_SET = 1;
                        SP_INCR = 1;
                        SCR_ADDR_SEL = 2;
                        FLG_LD_SEL = 1;
                        FLG_Z_LD = 1;
                        FLG_C_LD = 1;
                    end
                endcase
            end
        endcase
    end
endmodule

