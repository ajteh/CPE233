`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2018 01:22:14 PM
// Design Name: 
// Module Name: Lab5sim
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


module Lab5sim();
    
   logic PROG_CLK;
   logic [9:0] PROG_ADDR=0;
   logic [17:0] PROG_IR; 
   ProgRom ProgRom_inst(.*);
     
    


   //create clock input
    always
    begin
        PROG_CLK = 1; #5;
        PROG_CLK = 0; #5;
    end
    
   

    
    always@(posedge PROG_CLK)
    begin
    PROG_ADDR=PROG_ADDR+1;
    end
    
        
      
    

endmodule
