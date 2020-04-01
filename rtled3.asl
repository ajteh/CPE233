

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || ;------------------------------------------------------------------------------------------------------
(0002)                       064  || .EQU LED_PORT		=   	0X40		;port for LED outputs
(0003)                       032  || .EQU SWITCH_PORT	=   	0X20		;port for switch inputs
(0004)                            || ;------------------------------------------------------------------------------------------------------
(0005)                            || 
(0006)                            || ;------------------------------------------------------------------------------------------------------
(0007)                            || ; - Other Constants
(0008)                            || ;------------------------------------------------------------------------------------------------------
(0009)                       001  || .EQU BIT_0_MASK = 0X01
(0010)                       002  || .EQU BIT_1_MASK = 0X02
(0011)                       004  || .EQU BIT_2_MASK = 0X04
(0012)                       008  || .EQU BIT_3_MASK = 0X08
(0013)                       016  || .EQU BIT_4_MASK = 0X10
(0014)                       032  || .EQU BIT_5_MASK = 0X20
(0015)                       064  || .EQU BIT_6_MASK = 0X40
(0016)                       128  || .EQU BIT_7_MASK = 0X80
(0017)                            || 
(0018)                       180  || .EQU INSIDE_FOR_COUNT    = 0xB4
(0019)                       202  || .EQU MIDDLE_FOR_COUNT    = 0xCA
(0020)                       170  || .EQU OUTSIDE_FOR_COUNT   = 0xAA
(0021)                            || 
(0022)                            || ;------------------------------------------------------------------------------------------------------
(0023)                            || 
(0024)                            || ;------------------------------------------------------------------------------------------------------
(0025)                            || ; - Memory Designation Constants
(0026)                            || ;------------------------------------------------------------------------------------------------------
(0027)                            || ;- .DESG
(0028)                            || ;- .ORG	0x00
(0029)                            || ;------------------------------------------------------------------------------------------------------
(0030)                            || 
(0031)                            || ;------------------------------------------------------------------------------------------------------
(0032)                            || ;- Main Program - FIVE DIFFERENT TEST CASES
(0033)                            || ;------------------------------------------------------------------------------------------------------
(0034)                            || 
(0035)                            || .CSEG
(0036)                       064  || .ORG		0x40
(0037)                            || 
(0038)  CS-0x040  0x37400  0x040  || INIT:		MOV 	R20,	0x00	;output register
(0039)  CS-0x041  0x36A00         || 			MOV 	R10, 	0x00	;used to set carry flag
(0040)  CS-0x042  0x36B01         || 			MOV 	R11, 	0x01	;used to set carry flag
(0041)  CS-0x043  0x3610F         || 			MOV 	R1, 	0x0F	;used for logic operations
(0042)  CS-0x044  0x362AA         || 			MOV 	R2, 	0xAA	;used for logic operations
(0043)                            || 
(0044)                            || ;---------------------------------------------------------------
(0045)                            || ;LSLTest:		MOV 	R6, R1
(0046)                            || ;			CMP	R10, R11
(0047)                            || ;			LSL 	R6
(0048)                            || ;			CMP 	R6, 0X1F
(0049)  CS-0x045  0x08243         || 			BRNE 	LSRTest
(0050)                            || 
(0051)  CS-0x046  0x23408         || 			OR 	R20,  BIT_3_MASK
(0052)  CS-0x047  0x35440         || 			OUT 	R20, LED_PORT
(0053)                            || 
(0054)  CS-0x048  0x04709  0x048  || LSRTest:		MOV 	R7, R1
(0055)  CS-0x049  0x04A58         || 			CMP	R10, R11
(0056)  CS-0x04A  0x10701         || 			LSR 	R7
(0057)  CS-0x04B  0x30787         || 			CMP 	R7, 0X87
(0058)  CS-0x04C  0x0827B         || 			BRNE 	LightLEDs;timedelay5
(0059)                            || 
(0060)  CS-0x04D  0x23410         || 			OR 	R20,  BIT_4_MASK
(0061)  CS-0x04E  0x35440         || 			OUT 	R20, LED_PORT
(0062)                            || 
(0063)                            || ;timedelay5:    	MOV     R17, OUTSIDE_FOR_COUNT  
(0064)                            || ;outside_for5: 	SUB     R17, 0x01
(0065)                            || 
(0066)                            || ;             	MOV     R18, MIDDLE_FOR_COUNT   
(0067)                            || ;middle_for5:  	SUB     R18, 0x01
(0068)                            ||              
(0069)                            || ;             	MOV     R19, INSIDE_FOR_COUNT   
(0070)                            || ;inside_for5:  	SUB     R19, 0x01
(0071)                            || ;             	BRNE    inside_for5
(0072)                            ||              
(0073)                            || ;             	OR      R18, 0x00              
(0074)                            ||  ;            	BRNE    middle_for5
(0075)                            ||              
(0076)                            ||   ;           	OR      R17, 0x00               
(0077)                            ||    ;          	BRNE    outside_for5
(0078)                            || 
(0079)                            || ;---------------------------------------------------------------
(0080)  CS-0x04F  0x234E0  0x04F  || LightLEDs:		OR	R20, 0xE0
(0081)  CS-0x050  0x35440         || 				OUT R20, LED_PORT
(0082)                            || 
(0083)                            || ;---------------------------------------------------------------
(0084)  CS-0x051  0x37F00  0x051  || endless_loop:	MOV R31, 0x00
(0085)  CS-0x052  0x08288         || 				BRN	endless_loop
(0086)                            || 				
(0087)                            || 				





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
ENDLESS_LOOP   0x051   (0084)  ||  0085 
INIT           0x040   (0038)  ||  
LIGHTLEDS      0x04F   (0080)  ||  0058 
LSRTEST        0x048   (0054)  ||  0049 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BIT_0_MASK     0x001   (0009)  ||  
BIT_1_MASK     0x002   (0010)  ||  
BIT_2_MASK     0x004   (0011)  ||  
BIT_3_MASK     0x008   (0012)  ||  0051 
BIT_4_MASK     0x010   (0013)  ||  0060 
BIT_5_MASK     0x020   (0014)  ||  
BIT_6_MASK     0x040   (0015)  ||  
BIT_7_MASK     0x080   (0016)  ||  
INSIDE_FOR_COUNT 0x0B4   (0018)  ||  
LED_PORT       0x040   (0002)  ||  0052 0061 0081 
MIDDLE_FOR_COUNT 0x0CA   (0019)  ||  
OUTSIDE_FOR_COUNT 0x0AA   (0020)  ||  
SWITCH_PORT    0x020   (0003)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
