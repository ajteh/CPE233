

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
(0003)                            || 
(0004)                            || 		 
(0005)                            || 		
(0006)                            || 		
(0007)  CS-0x001  0x36100  0x001  || MAIN: MOV R1,0x00; R1 gonna get screwed
(0008)  CS-0x002  0x36200         || 	  MOV R2,0x00
(0009)  CS-0x003  0x3219A         || 	  IN R1,0x9A   ; takes in value
(0010)                            || 
(0011)  CS-0x004  0x30100         || 	  CMP R1,0x00   ; if 0x00 just jump to output
(0012)  CS-0x005  0x08082         || 	  BREQ ZERO
(0013)  CS-0x006  0x3229A         || 	  IN R2,0x9A   ; next input
(0014)  CS-0x007  0x30200         || 	  CMP R2,0x00   ; jumps to output if 0x00
(0015)  CS-0x008  0x08082         || 	  BREQ ZERO
(0016)                            || 	  
(0017)                            || 	  
(0018)  CS-0x009  0x04309         || 	 MOV R3,R1; takes in the counting number from reg 2 (the second number)
(0019)  CS-0x00A  0x36400         || 	  MOV R4, 0x00; count for the top 8-bits 
(0020)                            || 	  
(0021)  CS-0x00B  0x2C201         || 	  SUB R2,0x01  ; subtract because if by itself 
(0022)  CS-0x00C  0x08099         || 	  CALL ADD_REG
(0023)                            || 	  
(0024)                            || 
(0025)                            || 	  
(0026)                            || 	  
(0027)  CS-0x00D  0x34441  0x00D  || OUTPUT_DONE: OUT R4,0x41
(0028)  CS-0x00E  0x34142         || 		     OUT R1,0x42
(0029)  CS-0x00F  0x08078  0x00F  || 			 END: BRN END
(0030)                            || 
(0031)  CS-0x010  0x36400  0x010  || ZERO:	MOV R4,0X00
(0032)  CS-0x011  0x36100         || 		MOV R1,0X00
(0033)  CS-0x012  0x08068         || 		BRN OUTPUT_DONE			 
(0034)                            || 			 
(0035)                     0x013  || ADD_REG:
(0036)  CS-0x013  0x30200         || 		 CMP R2,0x00 
(0037)  CS-0x014  0x080EA         || 		 BREQ GO2
(0038)  CS-0x015  0x2C201         || 		 SUB R2,0x01
(0039)  CS-0x016  0x02118         || 		 ADD R1,R3
(0040)                            || 		 
(0041)                            || 		
(0042)  CS-0x017  0x0A0C9         || 		BRCC SKIP
(0043)  CS-0x018  0x28401         || 		ADD R4,0x01
(0044)  CS-0x019  0x30200  0x019  || 		SKIP: CMP R2,0x00
(0045)  CS-0x01A  0x0809B         || 		BRNE ADD_REG 
(0046)  CS-0x01B  0x080E2         || 		BREQ GO
(0047)                            || 		
(0048)  CS-0x01C  0x18002  0x01C  || GO: RET
(0049)  CS-0x01D  0x18002  0x01D  || GO2: RET
(0050)                            || 





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
ADD_REG        0x013   (0035)  ||  0022 0045 
END            0x00F   (0029)  ||  0029 
GO             0x01C   (0048)  ||  0046 
GO2            0x01D   (0049)  ||  0037 
MAIN           0x001   (0007)  ||  
OUTPUT_DONE    0x00D   (0027)  ||  0033 
SKIP           0x019   (0044)  ||  0042 
ZERO           0x010   (0031)  ||  0012 0015 


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
