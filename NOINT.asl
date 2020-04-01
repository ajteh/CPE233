

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
(0004)                       064  || .EQU LEDS = 0X40
(0005)                       144  || .EQU SPEAKER = 0X90
(0006)                            || 
(0007)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08008  0x100  ||              BRN     0x01        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0008)  CS-0x001  0x36130         || MOV 	R1,48
(0009)  CS-0x002  0x36260         || MOV		R2,96
(0010)  CS-0x003  0x363BF         || MOV		R3,191
(0011)  CS-0x004  0x364FF         || MOV 	R4,255
(0012)  CS-0x005  0x365FF         || MOV 	R5,255
(0013)  CS-0x006  0x36600         || MOV		R6,0
(0014)  CS-0x007  0x36700         || MOV		R7,0
(0015)  CS-0x008  0x36800         || MOV 	R8,0
(0016)  CS-0x009  0x36900         || MOV		R9,0	
(0017)  CS-0x00A  0x36F00         || MOV     R15, 0x00; counter for scratch
(0018)  CS-0x00B  0x37000         || MOV     R16,0x00; counter for outputting scratch
(0019)  CS-0x00C  0x37F00         || MOV 	R31,0
(0020)                            || 
(0021)  CS-0x00D  0x32644  0x00D  || MAIN:  	IN R6,	KEYBOARD
(0022)  CS-0x00E  0x30600         || 		CMP R6, 0x00
(0023)  CS-0x00F  0x0806A         || 		BREQ MAIN
(0024)  CS-0x010  0x30609         || 		CMP R6,	0x09
(0025)  CS-0x011  0x0806A         || 		BREQ MAIN
(0026)  CS-0x012  0x30678         || 		CMP R6,	0X78
(0027)  CS-0x013  0x0828A         || 		BREQ	STORERECORDINGHOLD
(0028)  CS-0x014  0x30607         || 		CMP R6,	0X07
(0029)  CS-0x015  0x0821A         || 		BREQ 	PLAYRECORDING
(0030)  CS-0x016  0x34690         || 		OUT	R6, SPEAKER
(0031)  CS-0x017  0x08068         || 		BRN MAIN
(0032)                            ||   
(0033)                            || 				
(0034)  CS-0x018  0x364FF  0x018  || LOOP1: 	MOV R4,255
(0035)  CS-0x019  0x365FF  0x019  || LOOP2:	MOV R5,255
(0036)                            || 
(0037)                            || 
(0038)  CS-0x01A  0x2C501  0x01A  || LOOP3:	SUB R5,0X01
(0039)  CS-0x01B  0x080D3         || 		BRNE LOOP3
(0040)                            || 
(0041)  CS-0x01C  0x2C401         || 		SUB R4,0X01
(0042)  CS-0x01D  0x080CB         || 		BRNE LOOP2
(0043)                            || 
(0044)  CS-0x01E  0x2CA01         || 		SUB R10,0x01
(0045)  CS-0x01F  0x080C3         || 		BRNE LOOP1
(0046)                            || 		;MOV R20,0X00
(0047)                            || 		;OUT R20,SPEAKER
(0048)  CS-0x020  0x05078         || 		CMP R16, R15
(0049)  CS-0x021  0x0821B         || 		BRNE PLAYRECORDING
(0050)  CS-0x022  0x0806A         || 		BREQ MAIN
(0051)                            || 		
(0052)  CS-0x023  0x04A09  0x023  || PLAYQUART:  MOV R10,R1
(0053)  CS-0x024  0x35A90         || 			OUT R26,SPEAKER
(0054)  CS-0x025  0x080C0         || 			BRN LOOP1
(0055)  CS-0x026  0x04A11  0x026  || PLAYHALF:   MOV R10,R2
(0056)  CS-0x027  0x35A90         || 			OUT R26,SPEAKER
(0057)  CS-0x028  0x080C0         || 		    BRN LOOP1
(0058)  CS-0x029  0x04A19  0x029  || PLAYFULL:	MOV R10,R3
(0059)  CS-0x02A  0x35A90         || 			OUT R26,SPEAKER
(0060)  CS-0x02B  0x080C0         || 			BRN LOOP1
(0061)                            || 			
(0062)  CS-0x02C  0x30FFD  0x02C  || SET_QUART:	CMP R15,0xFD   ; compare with max
(0063)  CS-0x02D  0x0806A         || 			BREQ MAIN     ; ifR15 greater than max
(0064)  CS-0x02E  0x0417B         || 			ST R1,(R15)		; store time for note
(0065)                            || 			
(0066)  CS-0x02F  0x28F01         || 			ADD R15,0x01
(0067)  CS-0x030  0x081D8         || 			BRN STORENOTE
(0068)                            || 			;MOV R10,R1
(0069)                            || 			;MOV R31,255
(0070)                            || 			;OUT R20,LEDS
(0071)                            || 			;BRN LOOP1
(0072)  CS-0x031  0x30FFD  0x031  || SET_HALF:	CMP  R15,0xFD   ; compare with max
(0073)  CS-0x032  0x0806A         || 			BREQ MAIN
(0074)  CS-0x033  0x0427B         || 			ST R2,(R15)		; store time for note
(0075)  CS-0x034  0x28F01         || 			ADD R15,0x01
(0076)  CS-0x035  0x081D8         || 			BRN STORENOTE
(0077)                            || 
(0078)                            || 			;MOV R10,R2
(0079)                            || 			;MOV R31,0XAA
(0080)                            || 			;OUT R20,LEDS
(0081)                            || 			;BRN LOOP1
(0082)                            || 			
(0083)  CS-0x036  0x30FFD  0x036  || SET_FULL:	CMP  R15,0xFD   ; compare with max
(0084)  CS-0x037  0x0806A         || 			BREQ MAIN
(0085)  CS-0x038  0x0437B         || 			ST R3,(R15)		; store time for note
(0086)  CS-0x039  0x28F01         || 			ADD R15,0x01
(0087)  CS-0x03A  0x081D8         || 			BRN STORENOTE
(0088)                            || 		
(0089)                            || 			;MOV R31,0X55
(0090)                            || 			;OUT R20,LEDS
(0091)                            || 			;BRN LOOP1
(0092)                            || 
(0093)                            || 		
(0094)  CS-0x03B  0x32644  0x03B  || STORENOTE: 	IN 	R6,	KEYBOARD
(0095)  CS-0x03C  0x04638         || 			CMP R6,	R7
(0096)  CS-0x03D  0x081DA         || 			BREQ	STORENOTE
(0097)  CS-0x03E  0x30600         || 			CMP R6,	0x00  ; if zero go back to ma in
(0098)  CS-0x03F  0x081DA         || 			BREQ 	STORENOTE
(0099)  CS-0x040  0x0467B         || 		    ST R6,(R15)
(0100)  CS-0x041  0x28F01         || 			ADD R15,0x01
(0101)  CS-0x042  0x08288         || 			BRN STORERECORDINGHOLD
(0102)                            || 
(0103)                            || 		
(0104)                     0x043  || PLAYRECORDING: 
(0105)  CS-0x043  0x05982         || 			   LD R25, (R16) ; get the hold time
(0106)  CS-0x044  0x29001         || 			   ADD R16,0x01
(0107)  CS-0x045  0x05A82         || 			   LD R26, (R16)  ; store the note
(0108)  CS-0x046  0x29001         || 			   ADD R16,0x01
(0109)  CS-0x047  0x31930         || 			   CMP R25,0x30
(0110)  CS-0x048  0x0811A         || 			   BREQ PLAYQUART
(0111)  CS-0x049  0x31960         || 			   CMP R25,0x60
(0112)  CS-0x04A  0x08132         || 			   BREQ PLAYHALF
(0113)  CS-0x04B  0x319BF         || 			   CMP R25,0xBF
(0114)  CS-0x04C  0x0814A         || 			   BREQ PLAYFULL
(0115)  CS-0x04D  0x04F80         || 			   CMP R15,R16
(0116)  CS-0x04E  0x0821B         || 			   BRNE PLAYRECORDING
(0117)  CS-0x04F  0x35F90         || 			   OUT R31,SPEAKER
(0118)  CS-0x050  0x08068         || 			   BRN 	MAIN
(0119)                            || 			   
(0120)                            || 			   
(0121)                     0x051  || STORERECORDINGHOLD: 
(0122)                            || 		;IN 	R9, KEYBOARD
(0123)  CS-0x051  0x32744         || 		IN	R7,	KEYBOARD
(0124)  CS-0x052  0x30705         || 		CMP R7,	0X05
(0125)  CS-0x053  0x08162         || 		BREQ	SET_QUART
(0126)  CS-0x054  0x30706         || 		CMP R7,	0X06
(0127)  CS-0x055  0x0818A         || 		BREQ	SET_HALF
(0128)  CS-0x056  0x30704         || 		CMP R7,	0X04
(0129)  CS-0x057  0x081B2         || 		BREQ	SET_FULL
(0130)  CS-0x058  0x30709         || 		CMP R7, 0X09
(0131)  CS-0x059  0x0806A         || 		BREQ 	MAIN	;STOP RECORDING BEFORE PLAYING 
(0132)  CS-0x05A  0x08288         || 	    BRN STORERECORDINGHOLD
(0133)                            || 
(0134)                            || 
(0135)                            || 





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
LOOP1          0x018   (0034)  ||  0045 0054 0057 0060 
LOOP2          0x019   (0035)  ||  0042 
LOOP3          0x01A   (0038)  ||  0039 
MAIN           0x00D   (0021)  ||  0023 0025 0031 0050 0063 0073 0084 0118 0131 
PLAYFULL       0x029   (0058)  ||  0114 
PLAYHALF       0x026   (0055)  ||  0112 
PLAYQUART      0x023   (0052)  ||  0110 
PLAYRECORDING  0x043   (0104)  ||  0029 0049 0116 
SET_FULL       0x036   (0083)  ||  0129 
SET_HALF       0x031   (0072)  ||  0127 
SET_QUART      0x02C   (0062)  ||  0125 
STORENOTE      0x03B   (0094)  ||  0067 0076 0087 0096 0098 
STORERECORDINGHOLD 0x051   (0121)  ||  0027 0101 0132 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYBOARD       0x044   (0003)  ||  0021 0094 0123 
LEDS           0x040   (0004)  ||  
SPEAKER        0x090   (0005)  ||  0030 0053 0056 0059 0117 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
