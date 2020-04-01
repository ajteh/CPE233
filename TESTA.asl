

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


(0001)                            || .CSEG
(0002)                       016  || .ORG 0X10
(0003)                       068  || .EQU KEYBOARD = 0X44
(0004)                       064  || .EQU LEDS = 0X40
(0005)                       129  || .EQU SSEG = 0X81
(0006)                       144  || .EQU SPEAKER = 0X90
(0007)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08080  0x100  ||              BRN     0x10        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0008)  CS-0x010  0x36130         || MOV 	R1,48
(0009)  CS-0x011  0x36260         || MOV		R2,96
(0010)  CS-0x012  0x363BF         || MOV		R3,191
(0011)  CS-0x013  0x364FF         || MOV 	R4,255
(0012)  CS-0x014  0x365FF         || MOV 	R5,255
(0013)  CS-0x015  0x36600         || MOV		R6,0
(0014)  CS-0x016  0x36700         || MOV		R7,0
(0015)  CS-0x017  0x36800         || MOV 	R8,0
(0016)  CS-0x018  0x36900         || MOV		R9,0	
(0017)                            || 
(0018)  CS-0x019  0x1A000         || SEI
(0019)  CS-0x01A  0x080D0  0x01A  || MAIN:	BRN MAIN
(0020)                            || 
(0021)  CS-0x01B  0x364FF  0x01B  || LOOP1: 	MOV R4,255
(0022)  CS-0x01C  0x365FF  0x01C  || LOOP2:	MOV R5,255
(0023)                            || 
(0024)                            || 
(0025)  CS-0x01D  0x2C501  0x01D  || LOOP3:	SUB R5,0X01
(0026)  CS-0x01E  0x080EB         || 		BRNE LOOP3
(0027)                            || 
(0028)  CS-0x01F  0x2C401         || 		SUB R4,0X01
(0029)  CS-0x020  0x080E3         || 		BRNE LOOP2
(0030)                            || 
(0031)  CS-0x021  0x2CA01         || 		SUB R10,0x01
(0032)  CS-0x022  0x080DB         || 		BRNE LOOP1
(0033)  CS-0x023  0x34940         || 		OUT R9,LEDS
(0034)  CS-0x024  0x34990         || 		OUT R9,SPEAKER
(0035)  CS-0x025  0x1A003         || 		RETIE
(0036)                            || 		
(0037)                            || 
(0038)  CS-0x026  0x04A09  0x026  || SET_QUART:	MOV R10,R1
(0039)  CS-0x027  0x37FFF         || 			MOV R31,255
(0040)  CS-0x028  0x34790         || 			OUT R7, SPEAKER
(0041)  CS-0x029  0x35F40         || 			OUT R31,LEDS
(0042)  CS-0x02A  0x080D8         || 			BRN LOOP1
(0043)  CS-0x02B  0x04A11  0x02B  || SET_HALF:	MOV R10,R2
(0044)  CS-0x02C  0x37FAA         || 			MOV R31,0XAA
(0045)  CS-0x02D  0x34790         || 			OUT R7, SPEAKER
(0046)  CS-0x02E  0x35F40         || 			OUT R31,LEDS
(0047)  CS-0x02F  0x080D8         || 			BRN LOOP1
(0048)  CS-0x030  0x04A19  0x030  || SET_FULL:	MOV R10,R3
(0049)  CS-0x031  0x37F55         || 			MOV R31,0X55
(0050)  CS-0x032  0x34790         || 			OUT R7, SPEAKER
(0051)  CS-0x033  0x35F40         || 			OUT R31,LEDS
(0052)  CS-0x034  0x080D8         || 			BRN LOOP1
(0053)                            || 
(0054)  CS-0x035  0x32744  0x035  || NOTE:	IN R7, 	KEYBOARD		
(0055)  CS-0x036  0x30700         || 		CMP R7, 0X00
(0056)  CS-0x037  0x081AA         || 		BREQ NOTE		
(0057)  CS-0x038  0x081C8         || 		BRN LENGTH
(0058)                            || 
(0059)                            || 		
(0060)  CS-0x039  0x32644  0x039  || LENGTH:	IN R6,KEYBOARD
(0061)  CS-0x03A  0x30605         || 		CMP R6,0X05
(0062)  CS-0x03B  0x08132         || 		BREQ	SET_QUART
(0063)  CS-0x03C  0x30606         || 		CMP R6,0X06
(0064)  CS-0x03D  0x0815A         || 		BREQ	SET_HALF
(0065)  CS-0x03E  0x30604         || 		CMP R6,0X04
(0066)  CS-0x03F  0x08182         || 		BREQ	SET_FULL
(0067)  CS-0x040  0x081C8         || 		BRN LENGTH
(0068)                            || 		
(0069)  CS-0x041  0x326AA  0x041  || TRI:	IN R6, 0XAA
(0070)                            || 		
(0071)                            || 		
(0072)                       1023  || .ORG 0X3FF
(0073)  CS-0x3FF  0x081A8  0x3FF  || ISR: 	BRN NOTE





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
ISR            0x3FF   (0073)  ||  
LENGTH         0x039   (0060)  ||  0057 0067 
LOOP1          0x01B   (0021)  ||  0032 0042 0047 0052 
LOOP2          0x01C   (0022)  ||  0029 
LOOP3          0x01D   (0025)  ||  0026 
MAIN           0x01A   (0019)  ||  0019 
NOTE           0x035   (0054)  ||  0056 0073 
SET_FULL       0x030   (0048)  ||  0066 
SET_HALF       0x02B   (0043)  ||  0064 
SET_QUART      0x026   (0038)  ||  0062 
TRI            0x041   (0069)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYBOARD       0x044   (0003)  ||  0054 0060 
LEDS           0x040   (0004)  ||  0033 0041 0046 0051 
SPEAKER        0x090   (0006)  ||  0034 0040 0045 0050 
SSEG           0x081   (0005)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
