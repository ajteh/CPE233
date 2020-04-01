

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
(0003)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08080  0x100  ||              BRN     0x10        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0004)  CS-0x010  0x36100         || MOV R1,0x00
(0005)  CS-0x011  0x36200         || MOV R2,0x00
(0006)                            || 
(0007)  CS-0x012  0x32140         || IN R1,0x40
(0008)                            || 
(0009)  CS-0x013  0x36280         || MOV R2,0x80
(0010)  CS-0x014  0x04110         || CMP R1,R2
(0011)  CS-0x015  0x0A0B9         || BRCC DIVIDE
(0012)  CS-0x016  0x0A0D8         || BRCS MULT2
(0013)                            || 
(0014)                            || 
(0015)  CS-0x017  0x10101  0x017  || DIVIDE: LSR R1	;This function will divide the value by 4
(0016)  CS-0x018  0x18000         || 		CLC
(0017)  CS-0x019  0x10101         || 		LSR R1
(0018)  CS-0x01A  0x080F0         || 		BRN OUTPUT
(0019)                            || 		
(0020)  CS-0x01B  0x18000  0x01B  || MULT2:  CLC		;This function will multiply the value by 4
(0021)  CS-0x01C  0x10100         || 		LSL R1
(0022)  CS-0x01D  0x080F0         || 		BRN OUTPUT
(0023)                            || 		
(0024)  CS-0x01E  0x34142  0x01E  || OUTPUT: OUT R1,0x42





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
DIVIDE         0x017   (0015)  ||  0011 
MULT2          0x01B   (0020)  ||  0012 
OUTPUT         0x01E   (0024)  ||  0018 0022 


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
