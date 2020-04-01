

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
(0002)                       001  || .ORG 0X01
(0003)                       068  || .EQU KEYBOARD = 0X44
(0004)                       064  || .EQU LEDS = 0X40
(0005)                            || 
(0006)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08008  0x100  ||              BRN     0x01        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0007)  CS-0x001  0x36130         || MOV 	R1,48
(0008)  CS-0x002  0x36260         || MOV		R2,96
(0009)  CS-0x003  0x363BF         || MOV		R3,191
(0010)  CS-0x004  0x364FF         || MOV 	R4,255
(0011)  CS-0x005  0x365FF         || MOV 	R5,255
(0012)  CS-0x006  0x36600         || MOV		R6,0
(0013)  CS-0x007  0x36700         || MOV		R7,0
(0014)  CS-0x008  0x36800         || MOV 	R8,0
(0015)  CS-0x009  0x36900         || MOV		R9,0	
(0016)                            || 
(0017)  CS-0x00A  0x1A000         || SEI
(0018)                     0x00B  || MAIN:	
(0019)  CS-0x00B  0x08058         || 		BRN MAIN
(0020)                            || 
(0021)  CS-0x00C  0x364FF  0x00C  || LOOP1: 	MOV R4,255
(0022)  CS-0x00D  0x365FF  0x00D  || LOOP2:	MOV R5,255
(0023)                            || 
(0024)                            || 
(0025)  CS-0x00E  0x2C501  0x00E  || LOOP3:	SUB R5,0X01
(0026)  CS-0x00F  0x08073         || 		BRNE LOOP3
(0027)                            || 
(0028)  CS-0x010  0x2C401         || 		SUB R4,0X01
(0029)  CS-0x011  0x0806B         || 		BRNE LOOP2
(0030)                            || 
(0031)  CS-0x012  0x2CA01         || 		SUB R10,0x01
(0032)  CS-0x013  0x08063         || 		BRNE LOOP1
(0033)  CS-0x014  0x37F00         || 		MOV R31,0X00
(0034)  CS-0x015  0x35F40         || 		OUT R31,0X40
(0035)  CS-0x016  0x1A003         || 		RETIE
(0036)                            || 
(0037)                            || 
(0038)  CS-0x017  0x32644  0x017  || BLOOD:	IN R6, 	KEYBOARD
(0039)  CS-0x018  0x34640         || 		OUT R6, LEDS
(0040)  CS-0x019  0x08060         || 		BRN LOOP1
(0041)                            || 
(0042)                            || 		
(0043)                            || 		
(0044)                       1023  || .ORG 0X3FF
(0045)  CS-0x3FF  0x080B8  0x3FF  || ISR: 	BRN BLOOD





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
BLOOD          0x017   (0038)  ||  0045 
ISR            0x3FF   (0045)  ||  
LOOP1          0x00C   (0021)  ||  0032 0040 
LOOP2          0x00D   (0022)  ||  0029 
LOOP3          0x00E   (0025)  ||  0026 
MAIN           0x00B   (0018)  ||  0019 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYBOARD       0x044   (0003)  ||  0038 
LEDS           0x040   (0004)  ||  0039 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
