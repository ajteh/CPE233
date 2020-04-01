`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 11:14:22 AM
// Design Name: 
// Module Name: DAC
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


module DAC (
    input clk, 
    input [7:0] A,
    output logic sclk=0
    
    
    );     
   
   	logic [7:0] count = 0;    
   
always_ff @ (posedge clk)
   	begin
        count=count+1;
        if (A==0)  // handles the zero case; if zero produce 0 V
        begin
       		sclk<=0;  
       	end
       	else if (count<=A) // else produce clk  high for the count 
       	begin
           	sclk<=1;
       	end
        else 
        begin			
            sclk<=0;			// remainder have clk low
        end
    end
endmodule

