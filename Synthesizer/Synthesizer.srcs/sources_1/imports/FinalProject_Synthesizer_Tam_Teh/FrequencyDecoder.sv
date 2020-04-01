`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2019 12:18:31 AM
// Design Name: 
// Module Name: FrequencyDecoder
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


module Frequency_Decoder(
    input [7:0] A,
    input [1:0] mode,
    output logic [19:0]decode
     
    );
    always_comb
    begin
    case({mode,A})
        //MODE 1
        10'h11A:decode = 20'h5D579;  //C //OCTAVE 3 
        10'h11B:decode = 20'h58148;  
        10'h122:decode = 20'h53231;  //D
        10'h123:decode = 20'h4E78B;
        10'h121:decode = 20'h4A113;  //E
        10'h12A:decode = 20'h45E90;  //F
        10'h134:decode = 20'h41FBE;
        10'h132:decode = 20'h3E47E;  //G
        10'h133:decode = 20'h3AC95;  
        10'h131:decode = 20'h377C8;  //A
        10'h13B:decode = 20'h345F6;  
        10'h13A:decode = 20'h316EE;  //B
        10'h141:decode = 20'h2EA85;  //C 
        
        10'h115:decode = 20'h2EA85;  //C //OCTAVE 4 
        10'h11E:decode = 20'h2C0A4;  
        10'h11D:decode = 20'h29918;  //D
        10'h126:decode = 20'h273C0;
        10'h124:decode = 20'h25085;  //E
        10'h12D:decode = 20'h22F44;  //F
        10'h12E:decode = 20'h20FE2;
        10'h12C:decode = 20'h1F23F;  //G
        10'h136:decode = 20'h1D64A;  
        10'h135:decode = 20'h1BBE4;  //A
        10'h13D:decode = 20'h1A2FB;  
        10'h13C:decode = 20'h18B77;  //B
        10'h143:decode = 20'h17544;  //C 
        
        //MODE 2
        10'h21A:decode = 20'h2EA85;  //C //OCTAVE 4 
        10'h21B:decode = 20'h2C0A4;  
        10'h222:decode = 20'h29918;  //D
        10'h223:decode = 20'h273C0;
        10'h221:decode = 20'h25085;  //E
        10'h22A:decode = 20'h22F44;  //F
        10'h234:decode = 20'h20FE2;
        10'h232:decode = 20'h1F23F;  //G
        10'h233:decode = 20'h1D64A;  
        10'h231:decode = 20'h1BBE4;  //A
        10'h23B:decode = 20'h1A2FB;  
        10'h23A:decode = 20'h18B77;  //B
        10'h241:decode = 20'h17544;  //C   
        
        10'h215:decode = 20'h17544;  //C //OCTAVE 5
        10'h21E:decode = 20'h16050;  
        10'h21D:decode = 20'h14C8B;  //D
        10'h226:decode = 20'h139E1;
        10'h224:decode = 20'h12843;  //E
        10'h22D:decode = 20'h117A2;  //F
        10'h22E:decode = 20'h107F0;
        10'h22C:decode = 20'h0F920;  //G
        10'h236:decode = 20'h0EB24;  
        10'h235:decode = 20'h0DDF2;  //A
        10'h23D:decode = 20'h0D17D;  
        10'h23C:decode = 20'h0C5BB;  //B
        10'h243:decode = 20'h0BAA2;  //C
             
        //MODE 3
        10'h31A:decode = 20'h17544;  //C //OCTAVE 5
        10'h31B:decode = 20'h16050;  
        10'h322:decode = 20'h14C8B;  //D
        10'h323:decode = 20'h139E1;
        10'h321:decode = 20'h12843;  //E
        10'h32A:decode = 20'h117A2;  //F
        10'h334:decode = 20'h107F0;
        10'h332:decode = 20'h0F920;  //G
        10'h333:decode = 20'h0EB24;  
        10'h331:decode = 20'h0DDF2;  //A
        10'h33B:decode = 20'h0D17D;  
        10'h33A:decode = 20'h0C5BB;  //B
        10'h341:decode = 20'h0BAA2;  //C
                
        10'h315:decode = 20'h0BAA2;    //C //OCTAVE 6 
        10'h31E:decode = 20'h0B028;
        10'h31D:decode = 20'h0A645;    //D
        10'h326:decode = 20'h09CF0;
        10'h324:decode = 20'h09422;    //E 
        10'h32D:decode = 20'h08BD1;    //F
        10'h32E:decode = 20'h083F8;
        10'h32C:decode = 20'h07C90;    //G
        10'h336:decode = 20'h07592;
        10'h335:decode = 20'h06EF9;    //A        
        10'h33D:decode = 20'h068BE;
        10'h33C:decode = 20'h062DD;    //B
        10'h343:decode = 20'h05D51;     //C
    default: decode=0;
    endcase
end
    
endmodule

//    0: decode=16'h0000;
//    1: decode=16'hBAA2;
//    2: decode=16'hB028;
//    3: decode=16'hA645;
//    4: decode=16'hA646;
//    5: decode=16'h9422;
//    6: decode=16'h8BD1;
//    7: decode=16'h83F8;
//    8: decode=16'h7C90;
//    9: decode=16'h7592;
//    10: decode=16'h6EF9;
//    11: decode=16'h68BF;
//    12: decode=16'h62DE;
//    13: decode=16'h5D51;
//    14: decode=16'h5814;
//    15: decode=16'h5323;
//    16: decode=16'h4E78;
//    17: decode=16'h4A11;
//    18: decode=16'h45E9;
//    19: decode=16'h41FC;
//    20: decode=16'h3E48;
//    21: decode=16'h3AC9;
//    22: decode=16'h377D;
//    23: decode=16'h345F;
//    24: decode=16'h316F;
//    25: decode=16'h2EA9;
//    26: decode=16'h2C0A;
//    27: decode=16'h2991;
//    28: decode=16'h273C;
//    29: decode=16'h2508;
//    30: decode=16'h22F4;
//    31: decode=16'h20FE;
//    32: decode=16'h1F24;
//    33: decode=16'h1D65;
//    34: decode=16'h1BBE;
//    35: decode=16'h1A30;
//    36: decode=16'h18B7;