

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
(0003)                            || 
(0004)  CS-0x010  0x36100         || MOV R1,0X00
(0005)  CS-0x011  0x36200         || MOV R2,0X00
(0006)  CS-0x012  0x36300         || MOV R3,0X00
(0007)  CS-0x013  0x3219A         || IN R1,0X9A
(0008)  CS-0x014  0x3229A         || IN R2,0X9A
(0009)                            || 
(0010)  CS-0x015  0x30200         || CMP R2,0x00
(0011)  CS-0x016  0x080F2         || BREQ OUTPUT
(0012)  CS-0x017  0x04110         || CMP R1,R2
(0013)  CS-0x018  0x0A0F0         || BRCS OUTPUT
(0014)  CS-0x019  0x02112  0x019  || DIV:	SUB R1,R2
(0015)  CS-0x01A  0x28301         || 		ADD R3,0X01
(0016)  CS-0x01B  0x04110         || 		CMP R1,R2
(0017)  CS-0x01C  0x0A0C9         || 		BRCC DIV
(0018)  CS-0x01D  0x0A0F0         || 		BRCS OUTPUT
(0019)                            || 
(0020)                            || 
(0021)  CS-0x01E  0x34342  0x01E  || OUTPUT: OUT R3,0X42
(0022)  CS-0x01F  0x34143         || 		OUT R1,0X43





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
DIV            0x019   (0014)  ||  0017 
OUTPUT         0x01E   (0021)  ||  0011 0013 0018 


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
