

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


(0001)                       155  || .EQU BTNS = 0x9B
(0002)                       064  || .EQU LEDS = 0x40
(0003)                       154  || .EQU SWITCHES = 0x9A
(0004)                            || 
(0005)                            || 
(0006)                            || .CSEG
(0007)                       001  || .ORG 0x01                
(0008)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08008  0x100  ||              BRN     0x01        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0009)  CS-0x001  0x36000         || MOV R0,0x00
(0010)  CS-0x002  0x36A00         || MOV R10,0x00
(0011)  CS-0x003  0x36B00         || MOV R11,0x00
(0012)  CS-0x004  0x1A000         || SEI ; enable interrupts
(0013)                            || 
(0014)  CS-0x005  0x30200  0x005  || MAIN: 	CMP R2,0X00
(0015)  CS-0x006  0x0802A         || 		BREQ MAIN
(0016)  CS-0x007  0x3219B         || 		IN R1, BTNS
(0017)  CS-0x008  0x20101         || 		AND R1, 0x01; take first bit
(0018)  CS-0x009  0x30101         || 		CMP R1,0x01; if button is 1
(0019)  CS-0x00A  0x08062         || 		BREQ REOUT
(0020)  CS-0x00B  0x0802B         || 		BRNE MAIN
(0021)                            || 		
(0022)  CS-0x00C  0x1A000  0x00C  || REOUT:	SEI
(0023)  CS-0x00D  0x36200         || 		MOV R2,0X00
(0024)  CS-0x00E  0x34A40         || 		OUT R10, LEDS
(0025)  CS-0x00F  0x08028         || 		BRN MAIN
(0026)                            || 	 
(0027)  CS-0x010  0x04B49  0x010  || ADDIN:	MOV R11, R9; holds value		 
(0028)  CS-0x011  0x00A4A         || 		EXOR R10,R9  ; holds the previous value or current value???????
(0029)  CS-0x012  0x34A40         || 		OUT R10,LEDS
(0030)  CS-0x013  0x1A003         || 		RETIE
(0031)                            || 			    
(0032)  CS-0x014  0x3299A  0x014  || ISR: IN R9,SWITCHES  ; takes in input from switches
(0033)  CS-0x015  0x04B48         ||      CMP R11,R9
(0034)  CS-0x016  0x08083         || 	 BRNE ADDIN
(0035)  CS-0x017  0x36201         || 	 MOV R2, 0X01
(0036)  CS-0x018  0x080CA         || 	 BREQ STOP
(0037)                            || 	
(0038)                     0x019  || STOP:
(0039)  CS-0x019  0x34040         || 	 OUT R0,LEDS
(0040)  CS-0x01A  0x1A002         || 	 RETID
(0041)  CS-0x01B  0x0802A         || 	 BREQ MAIN
(0042)                            || 
(0043)                       1023  || .ORG 0x3FF
(0044)  CS-0x3FF  0x080A0         || BRN ISR





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
ADDIN          0x010   (0027)  ||  0034 
ISR            0x014   (0032)  ||  0044 
MAIN           0x005   (0014)  ||  0015 0020 0025 0041 
REOUT          0x00C   (0022)  ||  0019 
STOP           0x019   (0038)  ||  0036 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BTNS           0x09B   (0001)  ||  0016 
LEDS           0x040   (0002)  ||  0024 0029 0039 
SWITCHES       0x09A   (0003)  ||  0032 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
