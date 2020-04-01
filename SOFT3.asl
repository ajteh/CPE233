

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
(0003)  CS-0x010  0x36100         || MOV R1,0x00
(0004)  CS-0x011  0x36200         || MOV R2,0x00
(0005)  CS-0x012  0x36304         || MOV R3,0x04
(0006)  CS-0x013  0x36500         || MOV R5,0X00
(0007)  CS-0x014  0x36600         || MOV R6,0x00
(0008)  CS-0x015  0x3219A         || IN R1,0x9A
(0009)                            || ;IN R2,0x9B
(0010)                            || 
(0011)                            || 
(0012)  CS-0x016  0x18000  0x016  || SHIFT:	CLC
(0013)  CS-0x017  0x10101         || 		LSR R1
(0014)                            || 		
(0015)  CS-0x018  0x10201         || 		LSR R2
(0016)  CS-0x019  0x2C301         || 		SUB R3,0x01
(0017)  CS-0x01A  0x080B3         || 		BRNE SHIFT
(0018)                            || 		
(0019)  CS-0x01B  0x36304         || MOV R3,0x04
(0020)  CS-0x01C  0x10202  0x01C  || ROTATE: ROL R2
(0021)  CS-0x01D  0x2C301         || 		SUB R3,0x01
(0022)  CS-0x01E  0x080E3         || 		BRNE ROTATE
(0023)  CS-0x01F  0x10101         || LSR R1
(0024)  CS-0x020  0x10100  0x020  || MULT: 	LSL R1
(0025)  CS-0x021  0x18000         || 		CLC
(0026)  CS-0x022  0x10201         || 		LSR R2
(0027)  CS-0x023  0x0A138         || 		BRCS ADDD
(0028)  CS-0x024  0x30200         || 		CMP R2,0X00
(0029)  CS-0x025  0x08152         || 		BREQ OUTPUT
(0030)  CS-0x026  0x08103         || 		BRNE MULT		
(0031)                            || 		
(0032)  CS-0x027  0x02508  0x027  || ADDD: 	ADD R5,R1
(0033)  CS-0x028  0x18000         || 		CLC
(0034)  CS-0x029  0x08103         || 		BRNE MULT
(0035)                            || 						
(0036)  CS-0x02A  0x34542  0x02A  || OUTPUT:	OUT R5, 0x42





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
ADDD           0x027   (0032)  ||  0027 
MULT           0x020   (0024)  ||  0030 0034 
OUTPUT         0x02A   (0036)  ||  0029 
ROTATE         0x01C   (0020)  ||  0022 
SHIFT          0x016   (0012)  ||  0017 


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
