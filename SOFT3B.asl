

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
(0003)  CS-0x010  0x362FF         || MOV R2,0xFF
(0004)  CS-0x011  0x363E0         || MOV R3,0xE0
(0005)  CS-0x012  0x364FF         || MOV R4,0xFF
(0006)  CS-0x013  0x36500         || MOV R5,0X00
(0007)  CS-0x014  0x3219A         || IN R1,0x9A
(0008)                            || 
(0009)                            || 
(0010)  CS-0x015  0x36400  0x015  || LOOP1: 	MOV R4,0X00
(0011)                            || 
(0012)  CS-0x016  0x36500  0x016  || LOOP2:	MOV R5,0X00
(0013)                            || 
(0014)  CS-0x017  0x28501  0x017  || LOOP3:	ADD R5,0X01
(0015)  CS-0x018  0x0A0B9         || 		BRCC LOOP3
(0016)                            || 
(0017)  CS-0x019  0x28401         || 		ADD R4,0X01
(0018)  CS-0x01A  0x0A0B1         || 		BRCC LOOP2
(0019)                            || 
(0020)  CS-0x01B  0x28301         || 		ADD R3,0x01
(0021)  CS-0x01C  0x0A0A9         || 		BRCC LOOP1
(0022)                            || 
(0023)                            || 
(0024)  CS-0x01D  0x34142  0x01D  || OUTPUT2: OUT R1,0x42





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
LOOP1          0x015   (0010)  ||  0021 
LOOP2          0x016   (0012)  ||  0018 
LOOP3          0x017   (0014)  ||  0015 
OUTPUT2        0x01D   (0024)  ||  


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
