

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
(0022)  CS-0x00E  0x30600  0x00E  || MAIN: 	CMP R6, 0x00
(0023)  CS-0x00F  0x08072         || 		BREQ MAIN
(0024)  CS-0x010  0x30709         || 		CMP R7,0x09
(0025)  CS-0x011  0x0A070         || 		BRCS MAIN
(0026)  CS-0x012  0x34690         || 		OUT R6,SPEAKER
(0027)  CS-0x013  0x08070         || 		BRN MAIN	
(0028)                            || 	   
(0029)                            || 				
(0030)  CS-0x014  0x364FF  0x014  || LOOP1: 	MOV R4,255
(0031)  CS-0x015  0x365FF  0x015  || LOOP2:	MOV R5,255
(0032)                            || 
(0033)                            || 
(0034)  CS-0x016  0x2C501  0x016  || LOOP3:	SUB R5,0X01
(0035)  CS-0x017  0x080B3         || 		BRNE LOOP3
(0036)                            || 
(0037)  CS-0x018  0x2C401         || 		SUB R4,0X01
(0038)  CS-0x019  0x080AB         || 		BRNE LOOP2
(0039)                            || 
(0040)  CS-0x01A  0x2CA01         || 		SUB R10,0x01
(0041)  CS-0x01B  0x080A3         || 		BRNE LOOP1
(0042)                            || 		;MOV R20,0X00
(0043)                            || 		;OUT R20,SPEAKER
(0044)  CS-0x01C  0x05078         || 		CMP R16, R15
(0045)  CS-0x01D  0x081FB         || 		BRNE PLAYRECORDING
(0046)  CS-0x01E  0x08322         || 		BREQ RETURN
(0047)                            || 		
(0048)  CS-0x01F  0x04A09  0x01F  || PLAYQUART:  MOV R10,R1
(0049)  CS-0x020  0x35A90         || 			OUT R26,SPEAKER
(0050)  CS-0x021  0x080A0         || 			BRN LOOP1
(0051)  CS-0x022  0x04A11  0x022  || PLAYHALF:   MOV R10,R2
(0052)  CS-0x023  0x35A90         || 			OUT R26,SPEAKER
(0053)  CS-0x024  0x080A0         || 		    BRN LOOP1
(0054)  CS-0x025  0x04A19  0x025  || PLAYFULL:	MOV R10,R3
(0055)  CS-0x026  0x35A90         || 			OUT R26,SPEAKER
(0056)  CS-0x027  0x080A0         || 			BRN LOOP1
(0057)                            || 			
(0058)  CS-0x028  0x30FFD  0x028  || SET_QUART:	CMP R15,0xFD   ; compare with max
(0059)  CS-0x029  0x08322         || 			BREQ RETURN     ; ifR15 greater than max
(0060)  CS-0x02A  0x0417B         || 			ST R1,(R15)		; store time for note
(0061)                            || 			
(0062)  CS-0x02B  0x28F01         || 			ADD R15,0x01
(0063)  CS-0x02C  0x081B8         || 			BRN STORENOTE
(0064)                            || 			;MOV R10,R1
(0065)                            || 			;MOV R31,255
(0066)                            || 			;OUT R20,LEDS
(0067)                            || 			;BRN LOOP1
(0068)  CS-0x02D  0x30FFD  0x02D  || SET_HALF:	CMP  R15,0xFD   ; compare with max
(0069)  CS-0x02E  0x08322         || 			BREQ RETURN
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
(0080)  CS-0x033  0x08322         || 			BREQ RETURN
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
(0097)  CS-0x03E  0x08278         || 			BRN STORERECORDINGHOLD
(0098)                            || 
(0099)                            || 		
(0100)  CS-0x03F  0x04F80  0x03F  || PLAYRECORDING: 	CMP R15,R16
(0101)  CS-0x040  0x08322         || 				BREQ RETURN
(0102)  CS-0x041  0x05982         || 				LD R25, (R16) ; get the hold time
(0103)  CS-0x042  0x29001         || 				ADD R16,0x01
(0104)  CS-0x043  0x05A82         || 				LD R26, (R16)  ; store the note
(0105)  CS-0x044  0x29001         || 				ADD R16,0x01
(0106)  CS-0x045  0x31930         || 				CMP R25,0x30
(0107)  CS-0x046  0x080FA         || 				BREQ PLAYQUART
(0108)  CS-0x047  0x31960         || 				CMP R25,0x60
(0109)  CS-0x048  0x08112         || 				BREQ PLAYHALF
(0110)  CS-0x049  0x319BF         || 				CMP R25,0xBF
(0111)  CS-0x04A  0x0812A         || 				BREQ PLAYFULL
(0112)  CS-0x04B  0x04F80         || 				CMP R15,R16
(0113)  CS-0x04C  0x081FB         || 				BRNE PLAYRECORDING
(0114)  CS-0x04D  0x35F90         || 				OUT R31,SPEAKER
(0115)  CS-0x04E  0x08320         || 				BRN 	RETURN
(0116)                            || 			   
(0117)                            || 			   
(0118)                     0x04F  || STORERECORDINGHOLD: 
(0119)                            || 		;IN 	R9, KEYBOARD
(0120)  CS-0x04F  0x32744         || 		IN	R7,	KEYBOARD
(0121)  CS-0x050  0x30705         || 		CMP R7,	0X05
(0122)  CS-0x051  0x08142         || 		BREQ	SET_QUART
(0123)  CS-0x052  0x30706         || 		CMP R7,	0X06
(0124)  CS-0x053  0x0816A         || 		BREQ	SET_HALF
(0125)  CS-0x054  0x30704         || 		CMP R7,	0X04
(0126)  CS-0x055  0x08192         || 		BREQ	SET_FULL
(0127)  CS-0x056  0x30709         || 		CMP R7, 0X09
(0128)  CS-0x057  0x0832A         || 		BREQ 	RETURNFROMSHOPPING	;STOP RECORDING BEFORE PLAYING 
(0129)  CS-0x058  0x08278         || 	    BRN STORERECORDINGHOLD
(0130)                            || 
(0131)                     0x059  || OVERWRITE:
(0132)  CS-0x059  0x36F00         || 		MOV R15,0x00
(0133)  CS-0x05A  0x37000         || 		MOV R16,0x00
(0134)  CS-0x05B  0x08320         || 		BRN RETURN
(0135)  CS-0x05C  0x32644  0x05C  || BLOOD:	IN R6, 	KEYBOARD	;RECORD ENABLE
(0136)                            || 		;CMP R6,	0X00
(0137)                            || 		;BREQ	RETURN
(0138)  CS-0x05D  0x30678         || 		CMP R6,	0X78
(0139)  CS-0x05E  0x0827A         || 		BREQ	STORERECORDINGHOLD
(0140)  CS-0x05F  0x30607         || 		CMP R6, 0X07
(0141)  CS-0x060  0x081FA         || 		BREQ	PLAYRECORDING
(0142)  CS-0x061  0x30666         || 		CMP R6, 0x66
(0143)  CS-0x062  0x082CA         || 		BREQ OVERWRITE
(0144)  CS-0x063  0x34690         || 		OUT	R6, SPEAKER
(0145)                            || 	
(0146)  CS-0x064  0x1A003  0x064  || RETURN:	RETIE
(0147)                            || 
(0148)  CS-0x065  0x36600  0x065  || RETURNFROMSHOPPING:	MOV R6,0X00
(0149)  CS-0x066  0x1A003         || 					RETIE
(0150)                            || 
(0151)                            || 
(0152)                       1023  || .ORG 0X3FF
(0153)  CS-0x3FF  0x082E0  0x3FF  || ISR: 	BRN BLOOD





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
BLOOD          0x05C   (0135)  ||  0153 
ISR            0x3FF   (0153)  ||  
LOOP1          0x014   (0030)  ||  0041 0050 0053 0056 
LOOP2          0x015   (0031)  ||  0038 
LOOP3          0x016   (0034)  ||  0035 
MAIN           0x00E   (0022)  ||  0023 0025 0027 
OVERWRITE      0x059   (0131)  ||  0143 
PLAYFULL       0x025   (0054)  ||  0111 
PLAYHALF       0x022   (0051)  ||  0109 
PLAYQUART      0x01F   (0048)  ||  0107 
PLAYRECORDING  0x03F   (0100)  ||  0045 0113 0141 
RETURN         0x064   (0146)  ||  0046 0059 0069 0080 0101 0115 0134 
RETURNFROMSHOPPING 0x065   (0148)  ||  0128 
SET_FULL       0x032   (0079)  ||  0126 
SET_HALF       0x02D   (0068)  ||  0124 
SET_QUART      0x028   (0058)  ||  0122 
STORENOTE      0x037   (0090)  ||  0063 0072 0083 0092 0094 
STORERECORDINGHOLD 0x04F   (0118)  ||  0097 0129 0139 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYBOARD       0x044   (0003)  ||  0090 0120 0135 
LEDS           0x040   (0004)  ||  
SPEAKER        0x090   (0005)  ||  0026 0049 0052 0055 0114 0144 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
