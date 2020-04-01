

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
(0021)  CS-0x00D  0x1A000         || SEI
(0022)  CS-0x00E  0x30600  0x00E  || MAIN:  CMP R6, 0x00
(0023)  CS-0x00F  0x08072         || 	   BREQ MAIN
(0024)  CS-0x010  0x30709         || 	   CMP R7,0x09
(0025)  CS-0x011  0x08072         || 	   BREQ MAIN
(0026)  CS-0x012  0x08070         || 	   BRN MAIN	
(0027)                            || 	   
(0028)                            || 				
(0029)  CS-0x013  0x364FF  0x013  || LOOP1: 	MOV R4,255
(0030)  CS-0x014  0x365FF  0x014  || LOOP2:	MOV R5,255
(0031)                            || 
(0032)                            || 
(0033)  CS-0x015  0x2C501  0x015  || LOOP3:	SUB R5,0X01
(0034)  CS-0x016  0x080AB         || 		BRNE LOOP3
(0035)                            || 
(0036)  CS-0x017  0x2C401         || 		SUB R4,0X01
(0037)  CS-0x018  0x080A3         || 		BRNE LOOP2
(0038)                            || 
(0039)  CS-0x019  0x2CA01         || 		SUB R10,0x01
(0040)  CS-0x01A  0x0809B         || 		BRNE LOOP1
(0041)                            || 		;MOV R20,0X00
(0042)                            || 		;OUT R20,SPEAKER
(0043)  CS-0x01B  0x05078         || 		CMP R16, R15
(0044)  CS-0x01C  0x081FB         || 		BRNE PLAYRECORDING
(0045)  CS-0x01D  0x35F90         || 		OUT R31,SPEAKER
(0046)  CS-0x01E  0x0830A         || 		BREQ RETURN
(0047)                            || 		
(0048)  CS-0x01F  0x04A09  0x01F  || PLAYQUART:  MOV R10,R1
(0049)  CS-0x020  0x35A90         || 			OUT R26,SPEAKER
(0050)  CS-0x021  0x08098         || 			BRN LOOP1
(0051)  CS-0x022  0x04A11  0x022  || PLAYHALF:   MOV R10,R2
(0052)  CS-0x023  0x35A90         || 			OUT R26,SPEAKER
(0053)  CS-0x024  0x08098         || 		    BRN LOOP1
(0054)  CS-0x025  0x04A19  0x025  || PLAYFULL:	MOV R10,R3
(0055)  CS-0x026  0x35A90         || 			OUT R26,SPEAKER
(0056)  CS-0x027  0x08098         || 			BRN LOOP1
(0057)                            || 			
(0058)  CS-0x028  0x30FFD  0x028  || SET_QUART:	CMP R15,0xFD   ; compare with max
(0059)  CS-0x029  0x0830A         || 			BREQ RETURN     ; ifR15 greater than max
(0060)  CS-0x02A  0x0417B         || 			ST R1,(R15)		; store time for note
(0061)                            || 			
(0062)  CS-0x02B  0x28F01         || 			ADD R15,0x01
(0063)  CS-0x02C  0x081B8         || 			BRN STORENOTE
(0064)                            || 			;MOV R10,R1
(0065)                            || 			;MOV R31,255
(0066)                            || 			;OUT R20,LEDS
(0067)                            || 			;BRN LOOP1
(0068)  CS-0x02D  0x30FFD  0x02D  || SET_HALF:	CMP  R15,0xFD   ; compare with max
(0069)  CS-0x02E  0x0830A         || 			BREQ RETURN
(0070)  CS-0x02F  0x0427B         || 			ST R2,(R15)		; store time for note
(0071)  CS-0x030  0x28F01         || 			ADD R15,0x01
(0072)  CS-0x031  0x081B8         || 			BRN STORENOTE
(0073)                            || 
(0074)                            || 			;MOV R10,R2
(0075)                            || 			;MOV R31,0XAA
(0076)                            || 			;OUT R20,LEDS
(0077)                            || 			;BRN LOOP1
(0078)                            || 			
(0079)  CS-0x032  0x30FFD  0x032  || SET_FULL:	CMP  R15,0xFD   ; compare with max
(0080)  CS-0x033  0x0830A         || 			BREQ RETURN
(0081)  CS-0x034  0x0437B         || 			ST R3,(R15)		; store time for note
(0082)  CS-0x035  0x28F01         || 			ADD R15,0x01
(0083)  CS-0x036  0x081B8         || 			BRN STORENOTE
(0084)                            || 		
(0085)                            || 			;MOV R31,0X55
(0086)                            || 			;OUT R20,LEDS
(0087)                            || 			;BRN LOOP1
(0088)                            || 
(0089)                            || 		
(0090)  CS-0x037  0x32644  0x037  || STORENOTE: 	IN 	R6,	KEYBOARD
(0091)  CS-0x038  0x04638         || 			CMP R6,	R7
(0092)  CS-0x039  0x081BA         || 			BREQ	STORENOTE
(0093)  CS-0x03A  0x30600         || 			CMP R6,	0x00  ; if zero go back to ma in
(0094)  CS-0x03B  0x081BA         || 			BREQ 	STORENOTE
(0095)  CS-0x03C  0x0467B         || 		    ST R6,(R15)
(0096)  CS-0x03D  0x28F01         || 			ADD R15,0x01
(0097)  CS-0x03E  0x08260         || 			BRN STORERECORDINGHOLD
(0098)                            || 
(0099)                            || 		
(0100)                     0x03F  || PLAYRECORDING: 
(0101)  CS-0x03F  0x05982         || 			   LD R25, 	(R16) ; get the hold time
(0102)  CS-0x040  0x29001         || 			   ADD R16,	0x01
(0103)  CS-0x041  0x05A82         || 			   LD R26, 	(R16)  ; store the note
(0104)  CS-0x042  0x29001         || 			   ADD R16,	0x01
(0105)  CS-0x043  0x31930         || 			   CMP R25,	0x30
(0106)  CS-0x044  0x080FA         || 			   BREQ 	PLAYQUART
(0107)  CS-0x045  0x31960         || 			   CMP R25,	0x60
(0108)  CS-0x046  0x08112         || 			   BREQ 	PLAYHALF
(0109)  CS-0x047  0x319BF         || 			   CMP R25,	0xBF
(0110)  CS-0x048  0x0812A         || 			   BREQ 	PLAYFULL
(0111)  CS-0x049  0x04F80         || 			   CMP R15,	R16
(0112)  CS-0x04A  0x081FB         || 			   BRNE 	PLAYRECORDING
(0113)  CS-0x04B  0x08308         || 			   BRN 		RETURN
(0114)                            || 			   
(0115)                            || 			   
(0116)                     0x04C  || STORERECORDINGHOLD: 
(0117)                            || 		;IN 	R9, KEYBOARD
(0118)  CS-0x04C  0x32744         || 		IN	R7,	KEYBOARD
(0119)  CS-0x04D  0x30705         || 		CMP R7,	0X05
(0120)  CS-0x04E  0x08142         || 		BREQ	SET_QUART
(0121)  CS-0x04F  0x30706         || 		CMP R7,	0X06
(0122)  CS-0x050  0x0816A         || 		BREQ	SET_HALF
(0123)  CS-0x051  0x30704         || 		CMP R7,	0X04
(0124)  CS-0x052  0x08192         || 		BREQ	SET_FULL
(0125)  CS-0x053  0x30709         || 		CMP R7, 0X09
(0126)  CS-0x054  0x0830A         || 		BREQ 	RETURN	;STOP RECORDING BEFORE PLAYING 
(0127)                            || 		
(0128)  CS-0x055  0x08260         || 	    BRN STORERECORDINGHOLD
(0129)  CS-0x056  0x36F00  0x056  || OVERWRITE: MOV R15,0x00
(0130)  CS-0x057  0x37000         || 		   MOV R16,0x00
(0131)  CS-0x058  0x1A003         || 		   RETIE
(0132)                            || 		   
(0133)  CS-0x059  0x32644  0x059  || BLOOD:	IN R6, 	KEYBOARD	;RECORD ENABLE
(0134)  CS-0x05A  0x34690         || 		OUT R6, SPEAKER
(0135)                            || 		;CMP R6,	0X00
(0136)                            || 		;BREQ	RETURN
(0137)  CS-0x05B  0x30678         || 		CMP R6,	0X78
(0138)  CS-0x05C  0x08262         || 		BREQ	STORERECORDINGHOLD
(0139)  CS-0x05D  0x30607         || 		CMP R6, 0X07
(0140)  CS-0x05E  0x081FA         || 		BREQ	PLAYRECORDING
(0141)  CS-0x05F  0x30666         || 		CMP R6,0x66
(0142)  CS-0x060  0x082B2         || 		BREQ OVERWRITE
(0143)                            || 	
(0144)  CS-0x061  0x1A003  0x061  || RETURN:	RETIE
(0145)                            || 
(0146)                       1023  || .ORG 0X3FF
(0147)  CS-0x3FF  0x082C8  0x3FF  || ISR: 	BRN BLOOD





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
BLOOD          0x059   (0133)  ||  0147 
ISR            0x3FF   (0147)  ||  
LOOP1          0x013   (0029)  ||  0040 0050 0053 0056 
LOOP2          0x014   (0030)  ||  0037 
LOOP3          0x015   (0033)  ||  0034 
MAIN           0x00E   (0022)  ||  0023 0025 0026 
OVERWRITE      0x056   (0129)  ||  0142 
PLAYFULL       0x025   (0054)  ||  0110 
PLAYHALF       0x022   (0051)  ||  0108 
PLAYQUART      0x01F   (0048)  ||  0106 
PLAYRECORDING  0x03F   (0100)  ||  0044 0112 0140 
RETURN         0x061   (0144)  ||  0046 0059 0069 0080 0113 0126 
SET_FULL       0x032   (0079)  ||  0124 
SET_HALF       0x02D   (0068)  ||  0122 
SET_QUART      0x028   (0058)  ||  0120 
STORENOTE      0x037   (0090)  ||  0063 0072 0083 0092 0094 
STORERECORDINGHOLD 0x04C   (0116)  ||  0097 0128 0138 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYBOARD       0x044   (0003)  ||  0090 0118 0133 
LEDS           0x040   (0004)  ||  
SPEAKER        0x090   (0005)  ||  0045 0049 0052 0055 0134 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
