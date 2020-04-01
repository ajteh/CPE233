

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
(0003)                       064  || .EQU INPUT_PORT = 0X40
(0004)                       065  || .EQU OUTPUT_PORT = 0X41
(0005)                            || 
(0006)                            || 
(0007)  CS-0x010  0x32140         || IN R1,INPUT_PORT	;INPUT VALUE TO R1 FROM INPUT PORT (USER SPECIFIES WHICH NOTE THEY WANT)		
(0008)  CS-0x011  0x34141         || OUT R1,OUTPUT_PORT	;OUTPUT VALUE R1 TO OUTPUT PORT (OUTPUTS THE CHOSEN CASE)
(0009)  CS-0x012  0x08099         || CALL WAIT			;CALLING WAIT FUNCTION TO LET THE NOTE RUN (WAIT FOR .5 SEC TO LET THE NOTE RUN)
(0010)                            || 
(0011)                     0x013  || WAIT:
(0012)  CS-0x013  0x36447  0x013  || LOOP1: 	MOV R4,0X47
(0013)                            || 
(0014)  CS-0x014  0x36548  0x014  || LOOP2:	MOV R5,0X48
(0015)                            || 
(0016)  CS-0x015  0x28501  0x015  || LOOP3:	ADD R5,0X01
(0017)  CS-0x016  0x0A0A9         || 		BRCC LOOP3	;iterate through loop 3
(0018)                            || 
(0019)  CS-0x017  0x28401         || 		ADD R4,0X01
(0020)  CS-0x018  0x0A0A1         || 		BRCC LOOP2	;iterate through loop 2
(0021)                            || 
(0022)  CS-0x019  0x28301         || 		ADD R3,0x01
(0023)  CS-0x01A  0x0A099         || 		BRCC LOOP1	;iterate through loop 1





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
LOOP1          0x013   (0012)  ||  0023 
LOOP2          0x014   (0014)  ||  0020 
LOOP3          0x015   (0016)  ||  0017 
WAIT           0x013   (0011)  ||  0009 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INPUT_PORT     0x040   (0003)  ||  0007 
OUTPUT_PORT    0x041   (0004)  ||  0008 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
