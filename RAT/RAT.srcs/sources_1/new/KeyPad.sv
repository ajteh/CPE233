`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2019 04:37:38 PM
// Design Name: 
// Module Name: KeyPad
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


module KeyPad(
    input CLK,
    input [2:0] COLS,
    output logic [3:0] ANODES,
    output logic [7:0] CATHODES,
    output logic Interrupt, B, F, G, D
    );
    logic sclk,LD,EN,RST;
    logic [3:0] Data, Dout,sseg;
    
    
    KeyPadRegister Register(.CLK(sclk),.LD(LD),.D(Data),.Q(Dout));
    KeyPadClkDiv ClkDiv(.CLK(CLK),.SCLK(sclk));
    KeyPadFSM FSM(.COLS(COLS),.CLK(sclk),.Data(Data),.Press(LD),.B(B),.F(F),.G(G),.D(D));
    KeyPadDecode Decode(.DATA(Dout),.DOUT(sseg));
//    KeyPadEN    Enable(.Press(LD),.RST(RST),.EN(EN));
    IntFSM      IntFSM(.CLK(CLK),.Press(LD),.interrupt(Interrupt));
//    KeyPadIntGen   IntGen(.CLK(CLK),.EN(EN),.Pulse(Interrupt));
    SevSegDisp Sseg(.CLK(CLK),.MODE(0),.DATA_IN({12'b000000000000,sseg}),.CATHODES(CATHODES),.ANODES(ANODES));
endmodule
