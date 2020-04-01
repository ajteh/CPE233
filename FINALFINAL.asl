

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
(0019)                            || 
(0020)  CS-0x00C  0x1A000         || SEI
(0021)  CS-0x00D  0x08068  0x00D  || MAIN:	BRN MAIN
(0022)                            || 				
(0023)  CS-0x00E  0x364FF  0x00E  || LOOP1: 	MOV R4,255
(0024)  CS-0x00F  0x365FF  0x00F  || LOOP2:	MOV R5,255
(0025)                            || 
(0026)                            || 
(0027)  CS-0x010  0x2C501  0x010  || LOOP3:	SUB R5,0X01
(0028)  CS-0x011  0x08083         || 		BRNE LOOP3
(0029)                            || 
(0030)  CS-0x012  0x2C401         || 		SUB R4,0X01
(0031)  CS-0x013  0x0807B         || 		BRNE LOOP2
(0032)                            || 
(0033)  CS-0x014  0x2CA01         || 		SUB R10,0x01
(0034)  CS-0x015  0x08073         || 		BRNE LOOP1
(0035)  CS-0x016  0x37400         || 		MOV R20,0X00
(0036)  CS-0x017  0x35440         || 		OUT R20,0X40
(0037)  CS-0x018  0x05078         || 		CMP R16, R15
(0038)  CS-0x019  0x0819B         || 		BRNE PLAYRECORDING
(0039)  CS-0x01A  0x08282         || 		BREQ RETURN
(0040)                            || 		
(0041)  CS-0x01B  0x04A09  0x01B  || PLAYQUART:  MOV R10,R1
(0042)  CS-0x01C  0x35A40         || 			OUT R26,LEDS
(0043)  CS-0x01D  0x08070         || 			BRN LOOP1
(0044)  CS-0x01E  0x04A11  0x01E  || PLAYHALF:   MOV R10,R2
(0045)  CS-0x01F  0x35A40         || 			OUT R26,LEDS
(0046)  CS-0x020  0x08070         || 		    BRN LOOP1
(0047)  CS-0x021  0x04A19  0x021  || PLAYFULL:	MOV R10,R3
(0048)  CS-0x022  0x35A40         || 			OUT R26,LEDS
(0049)  CS-0x023  0x08070         || 			BRN LOOP1
(0050)                            || 			
(0051)  CS-0x024  0x0467B  0x024  || SET_QUART:	ST R6,(R15)		; store time for note
(0052)  CS-0x025  0x28F01         || 			ADD R15,0x01
(0053)  CS-0x026  0x08168         || 			BRN STORENOTE
(0054)                            || 			;MOV R10,R1
(0055)                            || 			;MOV R31,255
(0056)                            || 			;OUT R20,LEDS
(0057)                            || 			;BRN LOOP1
(0058)  CS-0x027  0x0467B  0x027  || SET_HALF:	ST R6,(R15)		; store time for note
(0059)  CS-0x028  0x28F01         || 			ADD R15,0x01
(0060)  CS-0x029  0x08168         || 			BRN STORENOTE
(0061)                            || 
(0062)                            || 			;MOV R10,R2
(0063)                            || 			;MOV R31,0XAA
(0064)                            || 			;OUT R20,LEDS
(0065)                            || 			;BRN LOOP1
(0066)                            || 			
(0067)  CS-0x02A  0x0467B  0x02A  || SET_FULL:	ST R6,(R15)		; store time for note
(0068)  CS-0x02B  0x28F01         || 			ADD R15,0x01
(0069)  CS-0x02C  0x08168         || 			BRN STORENOTE
(0070)                            || 		
(0071)                            || 			;MOV R31,0X55
(0072)                            || 			;OUT R20,LEDS
(0073)                            || 			;BRN LOOP1
(0074)                            || 
(0075)                            || 		
(0076)  CS-0x02D  0x32644  0x02D  || STORENOTE: 	IN 	R6,KEYBOARD
(0077)  CS-0x02E  0x30600         || 			CMP R6,0x00  ; if zero go back to ma in
(0078)  CS-0x02F  0x0816A         || 			BREQ STORENOTE
(0079)  CS-0x030  0x0467B         || 		    ST R6,(R15)
(0080)  CS-0x031  0x28F01         || 			ADD R15,0x01
(0081)  CS-0x032  0x081E8         || 			BRN STORERECORDINGHOLD
(0082)                            || 
(0083)                            || 		
(0084)                     0x033  || PLAYRECORDING: 
(0085)  CS-0x033  0x05982         || 			   LD R25, (R16) ; get the hold time
(0086)  CS-0x034  0x29001         || 			   ADD R16,0x01
(0087)  CS-0x035  0x05A82         || 			   LD R26, (R16)  ; store the note
(0088)  CS-0x036  0x29001         || 			   ADD R16,0x01
(0089)  CS-0x037  0x31905         || 			   CMP R25,0x05
(0090)  CS-0x038  0x080DA         || 			   BREQ PLAYQUART
(0091)  CS-0x039  0x31906         || 			   CMP R25,0x06
(0092)  CS-0x03A  0x080F2         || 			   BREQ PLAYHALF
(0093)  CS-0x03B  0x31904         || 			   CMP R25,0x04
(0094)  CS-0x03C  0x0810A         || 			   BREQ PLAYFULL
(0095)                            || 			   
(0096)                            || 			   
(0097)                            || 			   
(0098)                     0x03D  || STORERECORDINGHOLD: 
(0099)  CS-0x03D  0x32944         || 		IN 	R9, KEYBOARD
(0100)  CS-0x03E  0x32744         || 		IN	R7,	KEYBOARD
(0101)  CS-0x03F  0x30705         || 		CMP R7,	0X05
(0102)  CS-0x040  0x08122         || 		BREQ	SET_QUART
(0103)  CS-0x041  0x30706         || 		CMP R7,	0X06
(0104)  CS-0x042  0x0813A         || 		BREQ	SET_HALF
(0105)  CS-0x043  0x30704         || 		CMP R7,	0X04
(0106)  CS-0x044  0x08152         || 		BREQ	SET_FULL
(0107)  CS-0x045  0x30909         || 		CMP R9, 0X09
(0108)  CS-0x046  0x08282         || 		BREQ 	RETURN	;STOP RECORDING BEFORE PLAYING 
(0109)  CS-0x047  0x081E8         || 		BRN STORERECORDINGHOLD
(0110)                            || 
(0111)  CS-0x048  0x32644  0x048  || BLOOD:	IN R6, 	KEYBOARD	;RECORD ENABLE
(0112)  CS-0x049  0x30600         || 		CMP R6,	0X00
(0113)  CS-0x04A  0x08282         || 		BREQ	RETURN
(0114)  CS-0x04B  0x30678         || 		CMP R6,	0X78
(0115)  CS-0x04C  0x081EA         || 		BREQ	STORERECORDINGHOLD
(0116)  CS-0x04D  0x30607         || 		CMP R6, 0X07
(0117)  CS-0x04E  0x0819A         || 		BREQ	PLAYRECORDING
(0118)  CS-0x04F  0x34690         || 		OUT R6, SPEAKER
(0119)                            || 	
(0120)  CS-0x050  0x1A003  0x050  || RETURN:	RETIE
(0121)                            || 
(0122)                       1023  || .ORG 0X3FF
(0123)  CS-0x3FF  0x08240  0x3FF  || ISR: 	BRN BLOOD





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
BLOOD          0x048   (0111)  ||  0123 
ISR            0x3FF   (0123)  ||  
LOOP1          0x00E   (0023)  ||  0034 0043 0046 0049 
LOOP2          0x00F   (0024)  ||  0031 
LOOP3          0x010   (0027)  ||  0028 
MAIN           0x00D   (0021)  ||  0021 
PLAYFULL       0x021   (0047)  ||  0094 
PLAYHALF       0x01E   (0044)  ||  0092 
PLAYQUART      0x01B   (0041)  ||  0090 
PLAYRECORDING  0x033   (0084)  ||  0038 0117 
RETURN         0x050   (0120)  ||  0039 0108 0113 
SET_FULL       0x02A   (0067)  ||  0106 
SET_HALF       0x027   (0058)  ||  0104 
SET_QUART      0x024   (0051)  ||  0102 
STORENOTE      0x02D   (0076)  ||  0053 0060 0069 0078 
STORERECORDINGHOLD 0x03D   (0098)  ||  0081 0109 0115 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYBOARD       0x044   (0003)  ||  0076 0099 0100 0111 
LEDS           0x040   (0004)  ||  0042 0045 0048 
SPEAKER        0x090   (0005)  ||  0118 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
