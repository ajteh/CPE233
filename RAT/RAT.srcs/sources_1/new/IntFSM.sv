`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2019 10:08:36 PM
// Design Name: 
// Module Name: IntFSM
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


module IntFSM(
    input Press,CLK,
    output logic interrupt
    );
    
    typedef enum{START,ST1,ST2,ST3,ST4,ST5,ST6,DONE}States;
    States NS,PS = START;
    
    always_ff@(posedge CLK)
    begin
        PS <= NS;
    end
    
    always_comb
    begin
    NS = START;
    interrupt = 0;
    case(PS)
        START:
        begin
            interrupt = 0;
            if (Press)
            begin
                NS = ST1;
                interrupt = 1;
            end
            else
                NS = START;
        end
        ST1:
        begin
            interrupt = 1;
            NS = ST2;
        end
        ST2:
        begin
            interrupt = 1;
            NS = ST3;
        end
        ST3:
        begin   
            interrupt = 1;
            NS = ST4;
        end
        ST4:
        begin
            interrupt = 1;
            NS = ST5;
        end
        ST5:
        begin
            interrupt = 1;
            NS = ST6;
        end
        ST6:
        begin
            interrupt = 1;
            NS = DONE;
        end
        DONE:
        begin
            interrupt = 0;
            if (Press == 0)
                NS = START;
            else
                NS = DONE;
        end
    endcase
    end
endmodule
