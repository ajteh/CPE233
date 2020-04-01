`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2019 08:12:27 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] SEL,
    input [7:0]A,
    input [7:0] B,
     input CIN,
     output logic [7:0]RESULT,
     output logic C,
     output logic Z
    );
    logic [8:0] x;
    always_comb
    begin
    case(SEL)
        4'b0000:x=A+B; 		//ADD             
        4'b0001:x=A+B+CIN; 	//ADDC
        4'b0010:x=A-B;		//SUB
        4'b0011:x=A-B-CIN; 	//SUBC
        4'b0100:x=A-B;		//CMP     
        4'b0101:x=A&B;   		//AND  
        4'b0110:x=A|B; 		//OR
        4'b0111:x=A^B;	   	//exor
        4'b1000:x=A&B;		//TEST   
        4'b1001:x={A[7],A[6:0],CIN}; 	//LSL
        4'b1010:x={A[0],CIN,A[7:1]}; 	//LSR
        4'b1011:x={A[7],A[6],A[5:0],A[7]}; //ROL   
        4'b1100:x={A[0],A[0],A[7:1]}; //ROR
        4'b1101:x={A[0],A[7],A[7:1]};//ASR
        4'b1110:x={CIN,B};  //MOV               
        default:x=0;        
        endcase
     end
  
        always_comb
        begin
    		RESULT=x[7:0];
    		C=x[8];
            if (RESULT==8'b00000000) 
    		  Z=1;
 		    else
              Z=0;
  	    end

endmodule

