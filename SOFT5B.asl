

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
(0005)                            || .DEF ARRAY_IN = R1
            syntax error
            syntax error
            syntax error

(0006)                            || .DEF ARRAY_POINT = R2
            syntax error
            syntax error
            syntax error

(0007)                            || .DEF ARRAY_SIZE = R3
            syntax error
            syntax error
            syntax error

(0008)                            || .DEF COUNT = R4
            syntax error
            syntax error
            syntax error

(0009)                            || .DEF START = R5 
            syntax error
            syntax error
            syntax error

(0010)                            || .DEF CURR = R6
            syntax error
            syntax error
            syntax error

(0011)                            || .DEF BEGIN = R7
            syntax error
            syntax error
            syntax error

(0012)                            || .DEF CURRENT = R9
            syntax error
            syntax error
            syntax error

(0013)                            || .DEF MIN = R8
            syntax error
            syntax error
            syntax error

(0014)                            || 
(0015)                            || .CSEG
(0016)                       096  || .ORG 0X60
(0017)                            || MOV COUNT,0x00
            syntax error
            syntax error

(0018)                            || MOV ARRAY_POINT,0X05
            syntax error
            syntax error

(0019)                            || MOV ARRAY_SIZE,0X05
            syntax error
            syntax error

(0020)                            || MOV COUNT,0x00
            syntax error
            syntax error

-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x001  0x3A005  0x005  ||              ST      r0,0x05     ; place reg data in mem 
-STUP-  CS-0x002  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x003  0x3A006  0x006  ||              ST      r0,0x06     ; place reg data in mem 
-STUP-  CS-0x004  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x005  0x3A007  0x007  ||              ST      r0,0x07     ; place reg data in mem 
-STUP-  CS-0x006  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x007  0x3A008  0x008  ||              ST      r0,0x08     ; place reg data in mem 
-STUP-  CS-0x008  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x009  0x3A009  0x009  ||              ST      r0,0x09     ; place reg data in mem 
-STUP-  CS-0x00A  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x00B  0x3A00A  0x00A  ||              ST      r0,0x0A     ; place reg data in mem 
-STUP-  CS-0x00C  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x00D  0x3A00B  0x00B  ||              ST      r0,0x0B     ; place reg data in mem 
-STUP-  CS-0x00E  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x00F  0x3A00C  0x00C  ||              ST      r0,0x0C     ; place reg data in mem 
-STUP-  CS-0x010  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x011  0x3A00D  0x00D  ||              ST      r0,0x0D     ; place reg data in mem 
-STUP-  CS-0x012  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x013  0x3A00E  0x00E  ||              ST      r0,0x0E     ; place reg data in mem 
-STUP-  CS-0x014  0x08300  0x100  ||              BRN     0x60        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0021)  CS-0x060  0x3219A  0x060  || INPUT:	IN R1, 0X9A
(0022)  CS-0x061  0x04113         || 		ST R1,(R2)
(0023)                            || 		ADD ARRAY_POINT,0X01
            syntax error
            syntax error

(0024)                            || 		ADD COUNT,0x01
            syntax error
            syntax error

(0025)  CS-0x062  0x0A300         || 		BRCS INPUT
            syntax error
            syntax error

(0026)                            || 
(0027)                            || MOV COUNT, 0x04;  counter for inputs
            syntax error
            syntax error

(0028)                            || MOV START, 0x05;   pointer
            syntax error
            syntax error

(0029)                            || MOV CURRENT, 0x05;   second pointer
            syntax error
            syntax error

(0030)                            || MOV CURR, 0X05
            syntax error
            syntax error

(0031)                            || LOOP:	MOV R6,START
            syntax error
            syntax error
            **ERROR # 1:  line# (0031) => MOV  

(0032)  CS-0x064  0x0472A         || 		LD R7,(R5)	;LOAD IN INITIAL VALUE
(0033)                            || 		BRN COMPARE
            **ERROR # 2:  line# (0033) => BRN label "COMPARE" has not been defined! 

(0034)                            || 		
(0035)                            || COMPARE:ADD CURR,0x01
            syntax error
            syntax error

(0036)  CS-0x066  0x08382         || 		BREQ RESET
            syntax error
            syntax error

(0037)  CS-0x067  0x04932         || 		LD R9,(R6)
(0038)                            || 		BRCC COMPARE
            syntax error
            syntax error
            **ERROR # 3:  line# (0038) => BRCC label "COMPARE" has not been defined! 

(0039)  CS-0x069  0x04C31         || MOV R12,R6		
            syntax error
            syntax error

(0040)  CS-0x06A  0x04962  0x06A  || SMALL: 	LD R9,(R12)
(0041)                            || 		CMP R12,ARRAY_SIZE
            **ERROR # 4:  line# (0041) => CMP label "COMPARE" has not been defined! 

(0042)  CS-0x06C  0x083AA         || 		BREQ SWAP
(0043)  CS-0x06D  0x28C01         || 		ADD R12,0X01
(0044)  CS-0x06E  0x0A350         || 		BRCS SMALL
            syntax error
            syntax error

(0045)  CS-0x06F  0x08350         || 		BRN SMALL 
            syntax error
            syntax error

(0046)                            || 														
(0047)                            || RESET:  MOV R10,START
            **ERROR # 5:  line# (0047) => MOV label "COMPARE" has not been defined! 

(0048)  CS-0x071  0x28A01         || 		ADD R10,0X01
(0049)                            || 		CMP R10, ARRAY_SIZE
            **ERROR # 6:  line# (0049) => CMP label "COMPARE" has not been defined! 

(0050)  CS-0x073  0x083C2         || 		BREQ DONE
(0051)                            || 		ADD START,0X01
            syntax error
            syntax error

(0052)  CS-0x074  0x0831B         || 		BRNE LOOP
(0053)                            || 		
(0054)  CS-0x075  0x0482B  0x075  || SWAP: 	ST R8,(R5)
(0055)  CS-0x076  0x04763         || 		ST R7,(R12)
(0056)                            || 		ADD START,0X01
            syntax error
            syntax error

(0057)  CS-0x077  0x0A318         || 		BRCS LOOP
            syntax error
            syntax error

(0058)                            || 		
(0059)                            || 				
(0060)  CS-0x078  0x34842  0x078  || DONE: OUT R8,0x42





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
DONE           0x078   (0060)  ||  0050 
INPUT          0x060   (0021)  ||  0025 
LOOP           0x063   (0031)  ||  0052 0057 
RESET          0x070   (0047)  ||  0036 
SMALL          0x06A   (0040)  ||  0044 0045 
SWAP           0x075   (0054)  ||  0042 


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
A              0x005   (0003)  ||  
