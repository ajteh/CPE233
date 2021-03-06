.CSEG
.ORG 0X01
.EQU KEYBOARD = 0X44
.EQU SPEAKER = 0x90


MOV 	R1,48
MOV		R2,96
MOV		R3,191
MOV 	R4,255
MOV 	R5,255
MOV		R6,0
MOV		R7,0
MOV 	R8,0
MOV		R9,0	
MOV     R15, 0x00; counter for scratch
MOV     R16,0x00; counter for outputting scratch

SEI
MAIN:	CMP R7, 0x05
		
		BREQ STORERECORDINGHOLD  ; start recording 
		CMP R7,0x06
		BREQ STORERECORDINGHOLD
		CMP R7,0x04
		BREQ STORERECORDINGHOLD
		
		CMP R6,0xD7      
		BREQ PLAYRECORDING
		
		CMP R6,0x78
		BREQ STORENOTE
		MOV R6,0x00
		OUT R6,SPEAKER
		BRN MAIN

		
		
RESETINPUT: MOV R6,0x00
			BRN MAIN
STORERECORDINGHOLD: 
		
		CMP R7,	0X05
		BREQ	SET_QUART
		CMP R7,	0X06
		BREQ	SET_HALF
		CMP R7,	0X04
		BREQ	SET_FULL
		
		
LOOP1: 	MOV R4,255
LOOP2:	MOV R5,255


LOOP3:	SUB R5,0X01
		BRNE LOOP3

		SUB R4,0X01
		BRNE LOOP2

		SUB R10,0x01
		BRNE LOOP1
		MOV R20,0X00
		OUT R20,0X40
		CMP R16, R15
		BREQ RESETINPUT
		BRNE PLAYRECORDING
		
PLAYQUART:  MOV R10,R1
			OUT R26,SPEAKER
			BRN LOOP1
PLAYHALF:   MOV R10,R2
			OUT R26,SPEAKER
		    BRN LOOP1
PLAYFULL:	MOV R10,R3
			OUT R26,SPEAKER
			BRN LOOP1
			
SET_QUART:	ST R6,(R15)		; store time for note
			ADD R15,0x01
			
			BRN RESETINPUT
			;MOV R10,R1
			;MOV R31,255
			;OUT R20,LEDS
			;BRN LOOP1
SET_HALF:	ST R6,(R15)		; store time for note
			ADD R15,0x01
			
			BRN RESETINPUT
			;MOV R10,R2
			;MOV R31,0XAA
			;OUT R20,LEDS
			;BRN LOOP1
			
SET_FULL:	ST R6,(R15)		; store time for note
			ADD R15,0x01
	
			BRN RESETINPUT
		
			;MOV R31,0X55
			;OUT R20,LEDS
			;BRN LOOP1

		
STORENOTE: CMP R6,0x00  ; if zero go back to ma in
		   BREQ MAIN
		    ST R6,(R15)
		   ADD R15,0x01
		   BRN RESETINPUT

		
PLAYRECORDING: 
			   LD R25, (R16) ; get the hold time
			   ADD R16,0x01
			   LD R26, (R16)  ; store the note
			   ADD R16,0x01
			   CMP R25,0x05
			   BREQ PLAYQUART
			   CMP R25,0x06
			   BREQ PLAYHALF
			   CMP R25,0x04
			   BREQ PLAYFULL
			   
			   BRN MAIN

 
GETHOLD: IN R7,KEYBOARD
		 RETIE
BLOOD:	IN R6, 	KEYBOARD
		;IN R7,KEYBOARD
		CMP R6, 0x78
		BREQ GETHOLD
		OUT R6, SPEAKER     ; outputs the notes even if record wanted
		
		RETIE
		
.ORG 0X3FF
ISR: 	BRN BLOOD
