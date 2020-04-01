

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
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08080  0x100  ||              BRN     0x10        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0003)  CS-0x010  0x1A000         || SEI
(0004)                     0x011  || MAIN:	;IN 	R6,	0X44
(0005)                            || 		;CMP R6,	0XF0
(0006)                            || 		;BREQ	OUTPUT
(0007)  CS-0x011  0x08088         || 		BRN	MAIN
(0008)                            || 		
(0009)  CS-0x012  0x34640  0x012  || OUTPUT:	OUT R6,	0X40
(0010)  CS-0x013  0x1A003         || 		RETIE
(0011)                            || 
(0012)                            || 		
(0013)                     0x014  || ISR:
(0014)  CS-0x014  0x32644         || IN 	R6, 0x44
(0015)  CS-0x015  0x306F0         || CMP R6, 0xF0
(0016)  CS-0x016  0x08092         || BREQ OUTPUT
(0017)  CS-0x017  0x1A003         || RETIE		
(0018)                       1023  || .ORG 0x3FF
(0019)  CS-0x3FF  0x080A0         || BRN ISR





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
ISR            0x014   (0013)  ||  0019 
MAIN           0x011   (0004)  ||  0007 
OUTPUT         0x012   (0009)  ||  0016 


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
