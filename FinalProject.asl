

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
(0003)                       068  || .EQU KEYBOARD = 0X44       ; output address of keyboard
(0004)                       064  || .EQU LEDS = 0X40           ; output address of LEDS
(0005)                       144  || .EQU SPEAKER = 0X90        ; output address of SPEAKER 
(0006)                            || 
(0007)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08008  0x100  ||              BRN     0x01        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0008)  CS-0x001  0x36130         || MOV 	R1,48              ; register used for loops for set time for quarter note
(0009)  CS-0x002  0x36260         || MOV		R2,96              ;register used for loops for set time  for half note 
(0010)  CS-0x003  0x363BF         || MOV		R3,191             ; register used for loops for set time  for full note
(0011)  CS-0x004  0x364FF         || MOV 	R4,255       
(0012)  CS-0x005  0x365FF         || MOV 	R5,255
(0013)  CS-0x006  0x36600         || MOV		R6,0               ; declare register used for input
(0014)  CS-0x007  0x36700         || MOV		R7,0               ; register used for second input if recording happens
(0015)  CS-0x008  0x36800         || MOV 	R8,0                
(0016)  CS-0x009  0x36900         || MOV		R9,0	
(0017)  CS-0x00A  0x36F00         || MOV     R15, 0x00; counter for inserting into scratch
(0018)  CS-0x00B  0x37000         || MOV     R16,0x00; counter for outputting scratch
(0019)  CS-0x00C  0x37F00         || MOV 	R31,0             ; register used to output nothing to speakers 
(0020)                            || 
(0021)  CS-0x00D  0x1A000         || SEI
(0022)  CS-0x00E  0x30600  0x00E  || MAIN: 	CMP R6, 0x00          
(0023)  CS-0x00F  0x08072         || 		BREQ MAIN
(0024)  CS-0x010  0x30709         || 		CMP R7,	0x09
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
(0045)  CS-0x01D  0x08203         || 		BRNE PLAYRECORDING
(0046)  CS-0x01E  0x37000         || 		MOV R16,0X00
(0047)  CS-0x01F  0x08332         || 		BREQ RETURN
(0048)                            || 		
(0049)  CS-0x020  0x04A09  0x020  || PLAYQUART:  MOV R10,R1                 ;move the R1 value into R10 to use within the loop as counter   for .5 sec
(0050)  CS-0x021  0x35A90         || 			OUT R26,SPEAKER
(0051)  CS-0x022  0x080A0         || 			BRN LOOP1
(0052)  CS-0x023  0x04A11  0x023  || PLAYHALF:   MOV R10,R2					; move the R2 value into R10 to use within the loop as counter for 1 sec
(0053)  CS-0x024  0x35A90         || 			OUT R26,SPEAKER
(0054)  CS-0x025  0x080A0         || 		    BRN LOOP1
(0055)  CS-0x026  0x04A19  0x026  || PLAYFULL:	MOV R10,R3                 ; move the R3 value into R10 to use within the loop as counter for 1.5 sec
(0056)  CS-0x027  0x35A90         || 			OUT R26,SPEAKER
(0057)  CS-0x028  0x080A0         || 			BRN LOOP1
(0058)                            || 			
(0059)  CS-0x029  0x30FFD  0x029  || SET_QUART:	CMP R15,0xFD   ; compare with max before storing, if max reached break out
(0060)  CS-0x02A  0x08332         || 			BREQ RETURN     ; ifR15 greater than max
(0061)  CS-0x02B  0x0417B         || 			ST R1,(R15)		; store time for note
(0062)                            || 			
(0063)  CS-0x02C  0x28F01         || 			ADD R15,0x01    ;increase the counter for next load
(0064)  CS-0x02D  0x081C0         || 			BRN STORENOTE
(0065)                            || 			;MOV R10,R1
(0066)                            || 			;MOV R31,255
(0067)                            || 			;OUT R20,LEDS
(0068)                            || 			;BRN LOOP1
(0069)  CS-0x02E  0x30FFD  0x02E  || SET_HALF:	CMP  R15,0xFD   ; compare with max before storing, if max reached break out
(0070)  CS-0x02F  0x08332         || 			BREQ RETURN
(0071)  CS-0x030  0x0427B         || 			ST R2,(R15)		; store time for note
(0072)  CS-0x031  0x28F01         || 			ADD R15,0x01  ; increase the counter for next load
(0073)  CS-0x032  0x081C0         || 			BRN STORENOTE
(0074)                            || 
(0075)                            || 			;MOV R10,R2
(0076)                            || 			;MOV R31,0XAA
(0077)                            || 			;OUT R20,LEDS
(0078)                            || 			;BRN LOOP1
(0079)                            || 			
(0080)  CS-0x033  0x30FFD  0x033  || SET_FULL:	CMP  R15,0xFD   ; compare with max before storing, if max reached break out
(0081)  CS-0x034  0x08332         || 			BREQ RETURN
(0082)  CS-0x035  0x0437B         || 			ST R3,(R15)		; store time for note
(0083)  CS-0x036  0x28F01         || 			ADD R15,0x01    ;increase the counter for next load
(0084)  CS-0x037  0x081C0         || 			BRN STORENOTE
(0085)                            || 		
(0086)                            || 			;MOV R31,0X55
(0087)                            || 			;OUT R20,LEDS
(0088)                            || 			;BRN LOOP1
(0089)                            || 
(0090)                            || 		
(0091)  CS-0x038  0x32644  0x038  || STORENOTE: 	IN 	R6,	KEYBOARD          ; whatever the note the user wants to record takes it in and stores it 
(0092)  CS-0x039  0x04638         || 			CMP R6,	R7
(0093)  CS-0x03A  0x081C2         || 			BREQ	STORENOTE         ; store the note
(0094)  CS-0x03B  0x30600         || 			CMP R6,	0x00               ; if zero go back to storing note constantly looking for one
(0095)  CS-0x03C  0x081C2         || 			BREQ 	STORENOTE         
(0096)  CS-0x03D  0x0467B         || 		    ST R6,(R15)
(0097)  CS-0x03E  0x28F01         || 			ADD R15,0x01
(0098)  CS-0x03F  0x08278         || 			BRN STORERECORDINGHOLD         ; go back to find a hold time
(0099)                            ||     
(0100)                            || 		
(0101)  CS-0x040  0x04F80  0x040  || PLAYRECORDING: 	CMP R15,R16        ; if R15 equals R16, nothing is played, deals with case of no recording or deleting
(0102)  CS-0x041  0x08332         || 				BREQ RETURN        ; if that happens go back to main and keep running
(0103)  CS-0x042  0x05982         || 				LD R25, (R16) ; get the hold time
(0104)  CS-0x043  0x29001         || 				ADD R16,0x01       ; add the scratch output pointer
(0105)  CS-0x044  0x05A82         || 				LD R26, (R16)     ; store the note
(0106)  CS-0x045  0x35A90         || 				OUT R26,SPEAKER   ; output the note
(0107)  CS-0x046  0x29001         || 				ADD R16,0x01       ; add the scratch output pointer
(0108)  CS-0x047  0x31930         || 				CMP R25,0x30       ; compares the hold time with quarter note, if it is then go and play it 
(0109)  CS-0x048  0x08102         || 				BREQ PLAYQUART
(0110)  CS-0x049  0x31960         || 				CMP R25,0x60    ; compares the hold time with half note, if it is then go and play it 
(0111)  CS-0x04A  0x0811A         || 				BREQ PLAYHALF
(0112)  CS-0x04B  0x319BF         || 				CMP R25,0xBF   ; compares the hold time with full note, if it is then go and play it 
(0113)  CS-0x04C  0x08132         || 				BREQ PLAYFULL
(0114)  CS-0x04D  0x04F80         || 				CMP R15,R16
(0115)  CS-0x04E  0x08203         || 				BRNE PLAYRECORDING   ; if it ends after going through scratch ram
(0116)                            || ;				OUT R31,SPEAKER
(0117)                            || ;				BRN 	RETURN
(0118)                            || 			   
(0119)                            || 			   
(0120)                     0x04F  || STORERECORDINGHOLD: 
(0121)                            || 		;IN 	R9, KEYBOARD
(0122)  CS-0x04F  0x32744         || 		IN	R7,	KEYBOARD         ; there are two inputs needed for storing recording, specifically here for taking in the hold time
(0123)  CS-0x050  0x30705         || 		CMP R7,	0X05			; compare the hold time input to F1, if it is then it is a quarternote
(0124)  CS-0x051  0x0814A         || 		BREQ	SET_QUART
(0125)  CS-0x052  0x30706         || 		CMP R7,	0X06             ; compare the hold time input to F2, if it is then it should be stored as a half note
(0126)  CS-0x053  0x08172         || 		BREQ	SET_HALF
(0127)  CS-0x054  0x30704         || 		CMP R7,	0X04              ; compare the hold time input to F3, if it is then it should be stored as a full note
(0128)  CS-0x055  0x0819A         || 		BREQ	SET_FULL 
(0129)  CS-0x056  0x30709         || 		CMP R7, 0X09             ; if the button pressed isn't a hold button but F10, then that means user wants to stop recording 
(0130)  CS-0x057  0x0833A         || 		BREQ 	RETURNFROMRECORDING	;STOP RECORDING BEFORE PLAYING 
(0131)  CS-0x058  0x08278         || 	    BRN STORERECORDINGHOLD          ; if no input keep looking for one after seeing that user wants to record 
(0132)                            || 
(0133)                     0x059  || OVERWRITE:							; overwrite SCR allowing the delete recording to occur
(0134)  CS-0x059  0x36F00         || 		MOV R15,0x00				; if backspace is hit then that means the SCR counters should go back to 0
(0135)  CS-0x05A  0x37000         || 		MOV R16,0x00
(0136)  CS-0x05B  0x08330         || 		BRN RETURN                 
(0137)                            || 
(0138)  CS-0x05C  0x32644  0x05C  || INTERRUPT:	IN R6, 	KEYBOARD	;Sets R6 to whatever comes in in the input from the interrupt 
(0139)  CS-0x05D  0x30600         || 		CMP R6,	0X00
(0140)  CS-0x05E  0x08332         || 		BREQ	RETURN
(0141)  CS-0x05F  0x30678         || 		CMP R6,	0X78            ; if the input value is F11 start recording
(0142)  CS-0x060  0x0827A         || 		BREQ	STORERECORDINGHOLD
(0143)  CS-0x061  0x30607         || 		CMP R6, 0X07			; if the input value is F12 play the recording
(0144)  CS-0x062  0x08202         || 		BREQ	PLAYRECORDING
(0145)  CS-0x063  0x30666         || 		CMP R6, 0x66
(0146)  CS-0x064  0x082CA         || 		BREQ OVERWRITE            ; if backspace is hit then delete recording
(0147)  CS-0x065  0x34690         || 		OUT	R6, SPEAKER				; else this means a normal key is pressed so out to speaker
(0148)                            || 	
(0149)  CS-0x066  0x1A003  0x066  || RETURN:	RETIE					; allow to return back to main enabling the interrupts
(0150)                            || 
(0151)  CS-0x067  0x36600  0x067  || RETURNFROMRECORDING: MOV R6,0X00
(0152)  CS-0x068  0x35F90         || 					OUT R31, SPEAKER
(0153)  CS-0x069  0x1A003         || 					RETIE
(0154)                            || ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(0155)                            || 
(0156)                       1023  || .ORG 0X3FF
(0157)  CS-0x3FF  0x082E0  0x3FF  || ISR: 	BRN INTERRUPT





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
INTERRUPT      0x05C   (0138)  ||  0157 
ISR            0x3FF   (0157)  ||  
LOOP1          0x014   (0030)  ||  0041 0051 0054 0057 
LOOP2          0x015   (0031)  ||  0038 
LOOP3          0x016   (0034)  ||  0035 
MAIN           0x00E   (0022)  ||  0023 0025 0027 
OVERWRITE      0x059   (0133)  ||  0146 
PLAYFULL       0x026   (0055)  ||  0113 
PLAYHALF       0x023   (0052)  ||  0111 
PLAYQUART      0x020   (0049)  ||  0109 
PLAYRECORDING  0x040   (0101)  ||  0045 0115 0144 
RETURN         0x066   (0149)  ||  0047 0060 0070 0081 0102 0136 0140 
RETURNFROMRECORDING 0x067   (0151)  ||  0130 
SET_FULL       0x033   (0080)  ||  0128 
SET_HALF       0x02E   (0069)  ||  0126 
SET_QUART      0x029   (0059)  ||  0124 
STORENOTE      0x038   (0091)  ||  0064 0073 0084 0093 0095 
STORERECORDINGHOLD 0x04F   (0120)  ||  0098 0131 0142 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYBOARD       0x044   (0003)  ||  0091 0122 0138 
LEDS           0x040   (0004)  ||  
SPEAKER        0x090   (0005)  ||  0026 0050 0053 0056 0106 0147 0152 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
