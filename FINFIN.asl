

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
(0002)                       001  || .ORG 0X01
(0003)                       068  || .EQU KEYBOARD = 0X44
(0004)                       144  || .EQU SPEAKER = 0x90
(0005)                            || 
(0006)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08008  0x100  ||              BRN     0x01        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0007)  CS-0x001  0x36130         || MOV 	R1,48
(0008)  CS-0x002  0x36260         || MOV		R2,96
(0009)  CS-0x003  0x363BF         || MOV		R3,191
(0010)  CS-0x004  0x364FF         || MOV 	R4,255
(0011)  CS-0x005  0x365FF         || MOV 	R5,255
(0012)  CS-0x006  0x36600         || MOV		R6,0
(0013)  CS-0x007  0x36700         || MOV		R7,0
(0014)  CS-0x008  0x36800         || MOV 	R8,0
(0015)  CS-0x009  0x36900         || MOV		R9,0	
(0016)  CS-0x00A  0x36F00         || MOV     R15, 0x00; counter for scratch
(0017)  CS-0x00B  0x37000         || MOV     R16,0x00; counter for outputting scratch
(0018)                            || 
(0019)  CS-0x00C  0x1A000         || SEI
(0020)  CS-0x00D  0x30705  0x00D  || MAIN:	CMP R7, 0x05
(0021)                            || 		
(0022)  CS-0x00E  0x080E2         || 		BREQ STORERECORDINGHOLD  ; start recording 
(0023)  CS-0x00F  0x30706         || 		CMP R7,0x06
(0024)  CS-0x010  0x080E2         || 		BREQ STORERECORDINGHOLD
(0025)  CS-0x011  0x30704         || 		CMP R7,0x04
(0026)  CS-0x012  0x080E2         || 		BREQ STORERECORDINGHOLD
(0027)                            || 		
(0028)  CS-0x013  0x306D7         || 		CMP R6,0xD7      
(0029)  CS-0x014  0x08232         || 		BREQ PLAYRECORDING
(0030)                            || 		
(0031)  CS-0x015  0x30678         || 		CMP R6,0x78
(0032)  CS-0x016  0x0820A         || 		BREQ STORENOTE
(0033)  CS-0x017  0x36600         || 		MOV R6,0x00
(0034)  CS-0x018  0x34690         || 		OUT R6,SPEAKER
(0035)  CS-0x019  0x08068         || 		BRN MAIN
(0036)                            || 
(0037)                            || 		
(0038)                            || 		
(0039)  CS-0x01A  0x36600  0x01A  || RESETINPUT: MOV R6,0x00
(0040)  CS-0x01B  0x08068         || 			BRN MAIN
(0041)                     0x01C  || STORERECORDINGHOLD: 
(0042)                            || 		
(0043)  CS-0x01C  0x30705         || 		CMP R7,	0X05
(0044)  CS-0x01D  0x081C2         || 		BREQ	SET_QUART
(0045)  CS-0x01E  0x30706         || 		CMP R7,	0X06
(0046)  CS-0x01F  0x081DA         || 		BREQ	SET_HALF
(0047)  CS-0x020  0x30704         || 		CMP R7,	0X04
(0048)  CS-0x021  0x081F2         || 		BREQ	SET_FULL
(0049)                            || 		
(0050)                            || 		
(0051)  CS-0x022  0x364FF  0x022  || LOOP1: 	MOV R4,255
(0052)  CS-0x023  0x365FF  0x023  || LOOP2:	MOV R5,255
(0053)                            || 
(0054)                            || 
(0055)  CS-0x024  0x2C501  0x024  || LOOP3:	SUB R5,0X01
(0056)  CS-0x025  0x08123         || 		BRNE LOOP3
(0057)                            || 
(0058)  CS-0x026  0x2C401         || 		SUB R4,0X01
(0059)  CS-0x027  0x0811B         || 		BRNE LOOP2
(0060)                            || 
(0061)  CS-0x028  0x2CA01         || 		SUB R10,0x01
(0062)  CS-0x029  0x08113         || 		BRNE LOOP1
(0063)  CS-0x02A  0x37400         || 		MOV R20,0X00
(0064)  CS-0x02B  0x35440         || 		OUT R20,0X40
(0065)  CS-0x02C  0x05078         || 		CMP R16, R15
(0066)  CS-0x02D  0x080D2         || 		BREQ RESETINPUT
(0067)  CS-0x02E  0x08233         || 		BRNE PLAYRECORDING
(0068)                            || 		
(0069)  CS-0x02F  0x04A09  0x02F  || PLAYQUART:  MOV R10,R1
(0070)  CS-0x030  0x35A90         || 			OUT R26,SPEAKER
(0071)  CS-0x031  0x08110         || 			BRN LOOP1
(0072)  CS-0x032  0x04A11  0x032  || PLAYHALF:   MOV R10,R2
(0073)  CS-0x033  0x35A90         || 			OUT R26,SPEAKER
(0074)  CS-0x034  0x08110         || 		    BRN LOOP1
(0075)  CS-0x035  0x04A19  0x035  || PLAYFULL:	MOV R10,R3
(0076)  CS-0x036  0x35A90         || 			OUT R26,SPEAKER
(0077)  CS-0x037  0x08110         || 			BRN LOOP1
(0078)                            || 			
(0079)  CS-0x038  0x0467B  0x038  || SET_QUART:	ST R6,(R15)		; store time for note
(0080)  CS-0x039  0x28F01         || 			ADD R15,0x01
(0081)                            || 			
(0082)  CS-0x03A  0x080D0         || 			BRN RESETINPUT
(0083)                            || 			;MOV R10,R1
(0084)                            || 			;MOV R31,255
(0085)                            || 			;OUT R20,LEDS
(0086)                            || 			;BRN LOOP1
(0087)  CS-0x03B  0x0467B  0x03B  || SET_HALF:	ST R6,(R15)		; store time for note
(0088)  CS-0x03C  0x28F01         || 			ADD R15,0x01
(0089)                            || 			
(0090)  CS-0x03D  0x080D0         || 			BRN RESETINPUT
(0091)                            || 			;MOV R10,R2
(0092)                            || 			;MOV R31,0XAA
(0093)                            || 			;OUT R20,LEDS
(0094)                            || 			;BRN LOOP1
(0095)                            || 			
(0096)  CS-0x03E  0x0467B  0x03E  || SET_FULL:	ST R6,(R15)		; store time for note
(0097)  CS-0x03F  0x28F01         || 			ADD R15,0x01
(0098)                            || 	
(0099)  CS-0x040  0x080D0         || 			BRN RESETINPUT
(0100)                            || 		
(0101)                            || 			;MOV R31,0X55
(0102)                            || 			;OUT R20,LEDS
(0103)                            || 			;BRN LOOP1
(0104)                            || 
(0105)                            || 		
(0106)  CS-0x041  0x30600  0x041  || STORENOTE: CMP R6,0x00  ; if zero go back to ma in
(0107)  CS-0x042  0x0806A         || 		   BREQ MAIN
(0108)  CS-0x043  0x0467B         || 		    ST R6,(R15)
(0109)  CS-0x044  0x28F01         || 		   ADD R15,0x01
(0110)  CS-0x045  0x080D0         || 		   BRN RESETINPUT
(0111)                            || 
(0112)                            || 		
(0113)                     0x046  || PLAYRECORDING: 
(0114)  CS-0x046  0x05982         || 			   LD R25, (R16) ; get the hold time
(0115)  CS-0x047  0x29001         || 			   ADD R16,0x01
(0116)  CS-0x048  0x05A82         || 			   LD R26, (R16)  ; store the note
(0117)  CS-0x049  0x29001         || 			   ADD R16,0x01
(0118)  CS-0x04A  0x31905         || 			   CMP R25,0x05
(0119)  CS-0x04B  0x0817A         || 			   BREQ PLAYQUART
(0120)  CS-0x04C  0x31906         || 			   CMP R25,0x06
(0121)  CS-0x04D  0x08192         || 			   BREQ PLAYHALF
(0122)  CS-0x04E  0x31904         || 			   CMP R25,0x04
(0123)  CS-0x04F  0x081AA         || 			   BREQ PLAYFULL
(0124)                            || 			   
(0125)  CS-0x050  0x08068         || 			   BRN MAIN
(0126)                            || 
(0127)                            ||  
(0128)  CS-0x051  0x32744  0x051  || GETHOLD: IN R7,KEYBOARD
(0129)  CS-0x052  0x1A003         || 		 RETIE
(0130)  CS-0x053  0x32644  0x053  || BLOOD:	IN R6, 	KEYBOARD
(0131)                            || 		;IN R7,KEYBOARD
(0132)  CS-0x054  0x30678         || 		CMP R6, 0x78
(0133)  CS-0x055  0x0828A         || 		BREQ GETHOLD
(0134)  CS-0x056  0x34690         || 		OUT R6, SPEAKER     ; outputs the notes even if record wanted
(0135)                            || 		
(0136)  CS-0x057  0x1A003         || 		RETIE
(0137)                            || 		
(0138)                       1023  || .ORG 0X3FF
(0139)  CS-0x3FF  0x08298  0x3FF  || ISR: 	BRN BLOOD





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
BLOOD          0x053   (0130)  ||  0139 
GETHOLD        0x051   (0128)  ||  0133 
ISR            0x3FF   (0139)  ||  
LOOP1          0x022   (0051)  ||  0062 0071 0074 0077 
LOOP2          0x023   (0052)  ||  0059 
LOOP3          0x024   (0055)  ||  0056 
MAIN           0x00D   (0020)  ||  0035 0040 0107 0125 
PLAYFULL       0x035   (0075)  ||  0123 
PLAYHALF       0x032   (0072)  ||  0121 
PLAYQUART      0x02F   (0069)  ||  0119 
PLAYRECORDING  0x046   (0113)  ||  0029 0067 
RESETINPUT     0x01A   (0039)  ||  0066 0082 0090 0099 0110 
SET_FULL       0x03E   (0096)  ||  0048 
SET_HALF       0x03B   (0087)  ||  0046 
SET_QUART      0x038   (0079)  ||  0044 
STORENOTE      0x041   (0106)  ||  0032 
STORERECORDINGHOLD 0x01C   (0041)  ||  0022 0024 0026 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYBOARD       0x044   (0003)  ||  0128 0130 
SPEAKER        0x090   (0004)  ||  0034 0070 0073 0076 0134 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
