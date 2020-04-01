

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
(0003)  DS-0x005             00A  || a: .DB 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
(0004)                            || 
(0005)                            || .DEF MIN, R9
            syntax error
            syntax error

(0006)                            || .DEF POINTER, R7
            syntax error
            syntax error

(0007)                            || .CSEG
(0008)                       032  || .ORG 0X20
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x001  0x3A005  0x005  ||              LD      r0,0x05     ; place reg data in mem 
-STUP-  CS-0x002  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x003  0x3A006  0x006  ||              LD      r0,0x06     ; place reg data in mem 
-STUP-  CS-0x004  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x005  0x3A007  0x007  ||              LD      r0,0x07     ; place reg data in mem 
-STUP-  CS-0x006  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x007  0x3A008  0x008  ||              LD      r0,0x08     ; place reg data in mem 
-STUP-  CS-0x008  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x009  0x3A009  0x009  ||              LD      r0,0x09     ; place reg data in mem 
-STUP-  CS-0x00A  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x00B  0x3A00A  0x00A  ||              LD      r0,0x0A     ; place reg data in mem 
-STUP-  CS-0x00C  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x00D  0x3A00B  0x00B  ||              LD      r0,0x0B     ; place reg data in mem 
-STUP-  CS-0x00E  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x00F  0x3A00C  0x00C  ||              LD      r0,0x0C     ; place reg data in mem 
-STUP-  CS-0x010  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x011  0x3A00D  0x00D  ||              LD      r0,0x0D     ; place reg data in mem 
-STUP-  CS-0x012  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x013  0x3A00E  0x00E  ||              LD      r0,0x0E     ; place reg data in mem 
-STUP-  CS-0x014  0x08100  0x100  ||              BRN     0x20        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0009)  CS-0x020  0x3600A         || MOV R0,0x0A
(0010)  CS-0x021  0x36205         || MOV R2,0X05
(0011)  CS-0x022  0x3630A         || MOV R3,0X0A
(0012)  CS-0x023  0x36400         || MOV R4,0x00
(0013)  CS-0x024  0x3219A  0x024  || INPUT:	IN R1, 0X9A
(0014)  CS-0x025  0x04113         || 		ST R1,(R2)
(0015)  CS-0x026  0x28201         || 		ADD R2,0X01
(0016)  CS-0x027  0x28401         || 		ADD R4,0x01
(0017)  CS-0x028  0x04400         || 		CMP R4,R0
(0018)  CS-0x029  0x0A120         || 		BRCS INPUT
(0019)                            || 
(0020)  CS-0x02A  0x36200         || MOV R2,0X00
(0021)  CS-0x02B  0x3640A         || MOV R4, 0x0A;  counter for inputs
(0022)  CS-0x02C  0x36505         || MOV R5, 0x05;   pointer
(0023)  CS-0x02D  0x36605         || MOV R6, 0X05;   second pointer
(0024)  CS-0x02E  0x36A00         || MOV R10,0x00; placement of min
(0025)                            || 
(0026)  CS-0x02F  0x0472A  0x02F  || LOOP: LD R7,(R5)
(0027)  CS-0x030  0x04832         || 	  LD R8,(R6)
(0028)  CS-0x031  0x04932         || 	  LD R9,(R6)  ; min value
(0029)                            || 	
(0030)  CS-0x032  0x18000  0x032  || CHECKTHROUGH:	CLC
(0031)  CS-0x033  0x28601         || 				ADD R6,0x01
(0032)  CS-0x034  0x3060F         || 				CMP R6,0x0F
(0033)  CS-0x035  0x08202         || 				BREQ ENTER
(0034)  CS-0x036  0x04832         || 				LD R8,(R6)
(0035)  CS-0x037  0x0A1C0         || 				BRCS MIN
(0036)                            || 			
(0037)  CS-0x038  0x18000  0x038  || MIN:      CLC
(0038)  CS-0x039  0x04940         || 		  CMP R9,R8
(0039)  CS-0x03A  0x0A1E1         || 		  BRCC PUT
(0040)  CS-0x03B  0x08190         || 		  BRN CHECKTHROUGH
(0041)                            || 		  
(0042)  CS-0x03C  0x04941  0x03C  || PUT:	  MOV R9,R8
(0043)  CS-0x03D  0x04A31         ||           MOV R10,R6
(0044)  CS-0x03E  0x04832         ||           LD R8,(R6)  
(0045)  CS-0x03F  0x08190         || 		  BRN CHECKTHROUGH  
(0046)                            || 		  
(0047)  CS-0x040  0x0492B  0x040  || ENTER:    ST R9,(R5)
(0048)  CS-0x041  0x30A00         || 		  CMP R10, 0x00
(0049)  CS-0x042  0x08223         || 		  BRNE ADDIN
(0050)  CS-0x043  0x08228         ||           BRN TRASH
(0051)  CS-0x044  0x04753  0x044  || ADDIN:    ST R7,(R10)			 
(0052)                            || 	
(0053)  CS-0x045  0x36A00  0x045  || TRASH:	MOV R10,0x00
(0054)  CS-0x046  0x34942         || 		OUT R9,0x42
(0055)  CS-0x047  0x28501         || 		ADD R5,0x01
(0056)  CS-0x048  0x04629         || 		MOV R6,R5
(0057)  CS-0x049  0x28201         || 		ADD R2,0x01
(0058)  CS-0x04A  0x18000         || 		CLC
(0059)  CS-0x04B  0x04220         || 		CMP R2,R4
(0060)  CS-0x04C  0x0A178         || 		BRCS LOOP
(0061)  CS-0x04D  0x08270         || 		BRN DONE
(0062)  CS-0x04E  0x34842  0x04E  || DONE: 	OUT R8,0x42





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
ADDIN          0x044   (0051)  ||  0049 
CHECKTHROUGH   0x032   (0030)  ||  0040 0045 
DONE           0x04E   (0062)  ||  0061 
ENTER          0x040   (0047)  ||  0033 
INPUT          0x024   (0013)  ||  0018 
LOOP           0x02F   (0026)  ||  0060 
MIN            0x038   (0037)  ||  0035 
PUT            0x03C   (0042)  ||  0039 
TRASH          0x045   (0053)  ||  0050 


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
A              0x00F   (0003)  ||  
