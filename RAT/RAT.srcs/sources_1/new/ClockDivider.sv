`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2019 12:17:35 AM
// Design Name: 
// Module Name: ClockDivider
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


module clockdivider (
    input clk, 
    input [19:0]clockdividerNum,
    output logic sclk
    
    
    );      
   
    logic [19:0] count = 0;    
    logic m_sclk=0;
    always_ff @ (posedge clk)
    
   	begin
     	   if (count< clockdividerNum) //if less keep counting
     	   begin
     	       count<=count+1;
     	   end
     	   else begin			
     	       m_sclk<=~m_sclk;
     	       count <=0;    			//reset count
     	   end
             
    	end
    
    always_comb
    	begin
     		if (clockdividerNum==0) // always block to check for 0 case
     		begin
      		    sclk=0;
     		end
     		else
     		begin
       		   sclk=m_sclk;
    		end
    end 
endmodule

