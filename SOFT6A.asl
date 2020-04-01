

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
(0008)  CS-0x022  0x3219A  0x022  || INPUT:	IN R1,0x9A	
(0009)  CS-0x023  0x301FF         || 		CMP R1,0xFF	
(0010)  CS-0x024  0x08142         || 		BREQ POPPING
(0011)  CS-0x025  0x28301         || 		ADD R3,0x01
(0012)  CS-0x026  0x12101         || 		PUSH R1	
(0013)  CS-0x027  0x08110         || 		BRN INPUT
(0014)                            || 
(0015)  CS-0x028  0x12202  0x028  || POPPING:POP R2
(0016)                            || 		
(0017)  CS-0x029  0x30300         || 		CMP R3,0x00
(0018)  CS-0x02A  0x08172         || 		BREQ DONE
(0019)                            || 		
(0020)                            || 		
(0021)                            || 		
(0022)  CS-0x02B  0x2C301  0x02B  || OUTPUT: SUB R3,0x01
(0023)  CS-0x02C  0x34242         || 		OUT R2,0x42
(0024)                            || 		
(0025)                            || 		
(0026)  CS-0x02D  0x08143         || 		BRNE POPPING
(0027)  CS-0x02E  0x34242  0x02E  || DONE: OUT R2,0x42





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
DONE           0x02E   (0027)  ||  0018 
INPUT          0x022   (0008)  ||  0013 
OUTPUT         0x02B   (0022)  ||  
POPPING        0x028   (0015)  ||  0010 0026 


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
