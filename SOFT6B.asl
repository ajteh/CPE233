

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


(0001)                            || .DSEG 
(0002)                       005  || .ORG 0x05
(0003)                            || 
(0004)                            || .CSEG
(0005)                       032  || .ORG 0x20
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08100  0x100  ||              BRN     0x20        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0006)  CS-0x020  0x36200         || MOV R2,0x00
(0007)  CS-0x021  0x36300         || MOV R3,0x00 ;count
(0008)  CS-0x022  0x364FF         || MOV R4,0xFF ; current register
(0009)                     0x023  || INPUT:
(0010)                            || 	
(0011)  CS-0x023  0x3219A         || 	IN R1,0x9A
(0012)                            || 	
(0013)  CS-0x024  0x301FF         || 	CMP R1,0xFF
(0014)                            || 	
(0015)  CS-0x025  0x0A149         || 	BRCC GOTHROUGH
(0016)  CS-0x026  0x28301         || 	ADD R3,0x01
(0017)  CS-0x027  0x12101         || 	PUSH R1
(0018)                            || 	
(0019)  CS-0x028  0x08118         || 	BRN INPUT
(0020)                            || 
(0021)                            || 	
(0022)  CS-0x029  0x04122  0x029  || GOTHROUGH: LD R1,(R4)
(0023)  CS-0x02A  0x2C401         || 		   SUB R4,0x01
(0024)  CS-0x02B  0x18000         || 		   CLC
(0025)  CS-0x02C  0x30300         || 		   CMP R3,0x00
(0026)  CS-0x02D  0x08182         || 		   BREQ OUTPUT
(0027)  CS-0x02E  0x2C301         || 		   SUB R3,0x01
(0028)  CS-0x02F  0x08180         || 		   BRN OUTPUT
(0029)                            || 		   
(0030)  CS-0x030  0x34142  0x030  || OUTPUT: OUT R1,0x42
(0031)  CS-0x031  0x30300         || 		CMP R3,0x00
(0032)  CS-0x032  0x0814B         || 		BRNE GOTHROUGH
(0033)                            || 		
(0034)                            || 		





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
GOTHROUGH      0x029   (0022)  ||  0015 0032 
INPUT          0x023   (0009)  ||  0019 
OUTPUT         0x030   (0030)  ||  0026 0028 


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
