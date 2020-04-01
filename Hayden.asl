

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
(0002)                       001  || .ORG 0x01
(0003)  CS-0x001  0x08048         || BRN MAIN
(0004)                            || 
(0005)  CS-0x002  0x2C201  0x002  || ADD_REG: SUB R2,0x01
(0006)  CS-0x003  0x02118         || 		 ADD R1,R3
(0007)                            || 		 
(0008)                            || 		 
(0009)  CS-0x004  0x0A031         || 		 BRCC SKIP
(0010)  CS-0x005  0x28401         || 		 ADD R4,0x01
(0011)  CS-0x006  0x30200  0x006  || SKIP: 	CMP R2,0x00
(0012)  CS-0x007  0x18002         || 		RET
(0013)  CS-0x008  0x08010         || 		BRN ADD_REG 
(0014)                            || 		 
(0015)                            || 
(0016)                            || 			
(0017)                            || 		
(0018)                            || 		 
(0019)                            || 
(0020)                            || 		 
(0021)                            || 		
(0022)                            || 		
(0023)  CS-0x009  0x36100  0x009  || MAIN: MOV R1,0x00
(0024)  CS-0x00A  0x36200         || 	  MOV R2,0x00
(0025)  CS-0x00B  0x3219A         || 	  IN R1,0x9A
(0026)  CS-0x00C  0x30100         || 	  CMP R1,0x00
(0027)  CS-0x00D  0x080A2         || 	  BREQ OUTPUT_DONE
(0028)  CS-0x00E  0x3229A         || 	  IN R2,0x9A   ; next input
(0029)  CS-0x00F  0x30100         || 	  CMP R1,0x00
(0030)  CS-0x010  0x080A2         || 	  BREQ OUTPUT_DONE
(0031)                            || 	  
(0032)                            || 	  
(0033)                            || 	  ; mult part
(0034)  CS-0x011  0x04311         || 	  MOV R3,R2; takes in the counting number from reg 2 (the second number)
(0035)  CS-0x012  0x36400         || 	  MOV R4, 0x00; count for the top numbers
(0036)  CS-0x013  0x08011         || 	  CALL ADD_REG
(0037)  CS-0x014  0x34441  0x014  || OUTPUT_DONE: OUT R4,0x41
(0038)  CS-0x015  0x34142         || 		     OUT R1,0x42





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
ADD_REG        0x002   (0005)  ||  0013 0036 
MAIN           0x009   (0023)  ||  0003 
OUTPUT_DONE    0x014   (0037)  ||  0027 0030 
SKIP           0x006   (0011)  ||  0009 


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
