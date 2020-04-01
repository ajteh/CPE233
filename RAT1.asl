

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
(0004)  CS-0x010  0x36200         || MOV R2,0x00
(0005)  CS-0x011  0x36200         || MOV R2, 0x00
(0006)  CS-0x012  0x36300         || MOV R3, 0x00
(0007)  CS-0x013  0x32230         || IN R2,0x30
(0008)  CS-0x014  0x32330         || IN R3,0x30
(0009)  CS-0x015  0x32430         || IN R4,0x30
(0010)                            || 
(0011)  CS-0x016  0x02510         || ADD R5,R2
(0012)  CS-0x017  0x02518         || ADD R5,R3
(0013)  CS-0x018  0x02520         || ADD R5,R4
(0014)  CS-0x019  0x34540         || OUT R5,0x40
(0015)                            || 
(0016)  CS-0x01A  0x32230         || IN R2,0x30
(0017)  CS-0x01B  0x242FF         || EXOR R2,0xFF
(0018)  CS-0x01C  0x28201         || ADD R2,0x01
(0019)  CS-0x01D  0x34240         || OUT R2,0x40





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
--> No labels used


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
