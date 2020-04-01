

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
(0002)                       016  || .ORG 0x10
(0003)  CS-0x010  0x32130         || IN R1, 0x30
(0004)  CS-0x011  0x04209         || MOV R2,R1
(0005)  CS-0x012  0x30100         || CMP R1,0x00
(0006)  CS-0x013  0x080DA         || BREQ CHECK2
(0007)  CS-0x014  0x0A0A9         || BRCC CHECK
(0008)                            || 
(0009)                            || 
(0010)  CS-0x015  0x10101  0x015  || CHECK: LSR R1
(0011)  CS-0x016  0x0A0D8         || 	   BRCS CHECK2
(0012)  CS-0x017  0x10101         || 	   LSR R1
(0013)  CS-0x018  0x0A0D8         || 	   BRCS CHECK2
(0014)  CS-0x019  0x0A111         || 	   BRCC OUTPUTINV
(0015)  CS-0x01A  0x08140         || 	   BRN OUTPUT
(0016)  CS-0x01B  0x18000  0x01B  || CHECK2: CLC
(0017)  CS-0x01C  0x04311         || 		MOV R3,R2   ; use R2 to check but R3 outputs
(0018)  CS-0x01D  0x10201         || 		LSR R2
(0019)  CS-0x01E  0x0A120         || 		BRCS ADDDIVBY2
(0020)  CS-0x01F  0x2C301         || 		SUB R3,0x01
(0021)  CS-0x020  0x04219         || 		MOV R2,R3
(0022)  CS-0x021  0x08140         || 		BRN OUTPUT     
(0023)  CS-0x022  0x242FF  0x022  || OUTPUTINV: EXOR R2,0xFF
(0024)  CS-0x023  0x08140         || 		   BRN OUTPUT
(0025)  CS-0x024  0x28311  0x024  || ADDDIVBY2: ADD R3,0x11
(0026)  CS-0x025  0x10301         || 		   LSR R3
(0027)  CS-0x026  0x04219         || 		   MOV R2,R3
(0028)  CS-0x027  0x08140         || 		   BRN OUTPUT
(0029)  CS-0x028  0x34242  0x028  || OUTPUT: OUT R2,0x42	
(0030)  CS-0x029  0x08018         || 		BRN 0x03





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
ADDDIVBY2      0x024   (0025)  ||  0019 
CHECK          0x015   (0010)  ||  0007 
CHECK2         0x01B   (0016)  ||  0006 0011 0013 
OUTPUT         0x028   (0029)  ||  0015 0022 0024 0028 
OUTPUTINV      0x022   (0023)  ||  0014 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
--> No ".EQU" directives used


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
