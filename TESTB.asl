

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
(0006)                       144  || .EQU SPEAKER = 0x90
(0007)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08080  0x100  ||              BRN     0x10        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0008)  CS-0x010  0x36130         || MOV 	R1,48
(0009)  CS-0x011  0x36260         || MOV		R2,96
(0010)  CS-0x012  0x363BF         || MOV		R3,191
(0011)  CS-0x013  0x36600         || MOV		R6,0
(0012)  CS-0x014  0x36700         || MOV		R7,0
(0013)  CS-0x015  0x36800         || MOV 	R8,0
(0014)  CS-0x016  0x36900         || MOV		R9,0	
(0015)                            || 
(0016)  CS-0x017  0x1A000         || SEI
(0017)  CS-0x018  0x080C0  0x018  || MAIN:	BRN MAIN
(0018)                            || 
(0019)  CS-0x019  0x364FF  0x019  || LOOP1: 	MOV R4,255
(0020)  CS-0x01A  0x365FF  0x01A  || LOOP2:	MOV R5,255
(0021)                            || 
(0022)                            || 
(0023)  CS-0x01B  0x2C501  0x01B  || LOOP3:	SUB R5,0X01
(0024)  CS-0x01C  0x080DB         || 		BRNE LOOP3
(0025)                            || 
(0026)  CS-0x01D  0x2C401         || 		SUB R4,0X01
(0027)  CS-0x01E  0x080D3         || 		BRNE LOOP2
(0028)                            || 
(0029)  CS-0x01F  0x2CA01         || 		SUB R10,0x01
(0030)  CS-0x020  0x080CB         || 		BRNE LOOP1
(0031)  CS-0x021  0x34940         || 		OUT R9,LEDS
(0032)  CS-0x022  0x34990         || 		OUT R9,SPEAKER
(0033)  CS-0x023  0x1A003         || 		RETIE
(0034)                            || 	
(0035)                            || 
(0036)  CS-0x024  0x32744  0x024  || NOTE:	IN R7, 	KEYBOARD
(0037)  CS-0x025  0x34790         || 		OUT R7, SPEAKER
(0038)  CS-0x026  0x08120         || 		BRN NOTE
(0039)                            || 	
(0040)                            || 		
(0041)                       1023  || .ORG 0X3FF
(0042)  CS-0x3FF  0x08120  0x3FF  || ISR: 	BRN NOTE





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
ISR            0x3FF   (0042)  ||  
LOOP1          0x019   (0019)  ||  0030 
LOOP2          0x01A   (0020)  ||  0027 
LOOP3          0x01B   (0023)  ||  0024 
MAIN           0x018   (0017)  ||  0017 
NOTE           0x024   (0036)  ||  0038 0042 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYBOARD       0x044   (0003)  ||  0036 
LEDS           0x040   (0004)  ||  0031 
SPEAKER        0x090   (0006)  ||  0032 0037 
SSEG           0x081   (0005)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
