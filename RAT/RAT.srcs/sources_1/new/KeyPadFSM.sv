`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 11:20:53 AM
// Design Name: 
// Module Name: KeyPadFSM
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


module KeyPadFSM(
    input [2:0]COLS,
    input CLK,
    output logic [3:0]Data,
    output logic Press, B,F, G, D
    );
    typedef enum{STB,STG,STF,STD,EXIT}States;
    States NS,PS = STB;
    
    always_ff @(posedge CLK)
    begin
        PS <= NS;
    end
    
    always_comb
    begin   
       NS = STB;
       B = 0;
       F = 0;
       G = 0;
       D = 0;
       Data = 13;
       Press = 0;
       case(PS)
       STB:
       begin
            NS = STB;
            B = 1;
            Press = 0;
            case(COLS)
                3'b100: 
                begin
                    Data = 1;
                    Press = 1;
                end
                3'b010:
                begin
                    Data = 2;
                    Press = 1;
                end
                3'b001: 
                begin
                    Data = 3;
                    Press = 1;
                end
                3'b000: 
                begin
                    Data = 0;
                    Press = 0;
                    NS = STG;
                end
            endcase
        end
        STG: 
        begin
            NS = STG;
            G = 1;
            Press = 0;
            case(COLS)
                3'b100:
                begin
                     Data = 4;
                     Press = 1;
                 end
                3'b010: 
                begin
                    Data = 5;
                    Press = 1;
                    
                end
                3'b001:
                begin
                     Data = 6;
                     Press = 1;
                end
                3'b000:
                begin
                    Data = 0;
                    Press = 0;
                    NS = STF;
                end
            endcase
        end
        STF:
        begin 
            NS = STF;
            F = 1;
            Press = 0;
            case(COLS)
                3'b100: 
                begin
                    Data = 7;
                    Press = 1;
                end
                3'b010: 
                begin
                    Data = 8;
                    Press = 1;
                end
                3'b001: 
                begin
                    Data = 9;
                    Press = 1;
                end
                3'b000:
                begin
                    Data = 0;
                    Press = 0;
                    NS = STD;
                end
            endcase
        end
        STD:
        begin
            NS = STD;
            D = 1;
            Press = 0;
            case(COLS)
                3'b100: 
                begin
                    Data = 10;
                    Press = 1;
                end
                3'b010: 
                begin
                    Data = 11;
                    Press = 1;
                end
                3'b001: 
                begin
                    Data = 12;
                    Press = 1;
                end
                3'b000:
                begin
                    Data = 0;
                    Press = 0;
                    NS = STB;
                end
            endcase
        end
        endcase
    end
           
endmodule
