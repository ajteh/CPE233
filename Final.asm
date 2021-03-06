.CSEG
.ORG 0X10
.EQU KEYBOARD = 0X44
.EQU LEDS = 0X40
.EQU SSEG = 0X81
.EQU SPEAKER = 0XFF

MOV 	R1,48
MOV		R2,96
MOV		R3,191
MOV 	R4,255
MOV 	R5,255
MOV		R6,0
MOV		R7,0
MOV 	R8,0
MOV		R9,0	

SEI
MAIN:	BRN MAIN

LOOP1: 	MOV R4,255
LOOP2:	MOV R5,255


LOOP3:	SUB R5,0X01
		BRNE LOOP3

		SUB R4,0X01
		BRNE LOOP2

		SUB R10,0x01
		BRNE LOOP1
		OUT R9,LEDS
		OUT R9,SPEAKER
		RETIE
		

SET_QUART:	MOV R10,R1
			MOV R31,255
			OUT R7, SPEAKER
			OUT R31,LEDS
			BRN LOOP1
SET_HALF:	MOV R10,R2
			MOV R31,0XAA
			OUT R7, SPEAKER
			OUT R31,LEDS
			BRN LOOP1
SET_FULL:	MOV R10,R3
			MOV R31,0X55
			OUT R7, SPEAKER
			OUT R31,LEDS
			BRN LOOP1

NOTE:	IN R7, 	KEYBOARD
		CMP R7, 0x00
		BREQ NOTE
		BRN LENGTH
		
LENGTH:	IN R6,KEYBOARD
		CMP R6,0X05
		BREQ	SET_QUART
		CMP R6,0X06
		BREQ	SET_HALF
		CMP R6,0X04
		BREQ	SET_FULL
		BRN LENGTH
		
TRI:	IN R6, 0XAA
		
		
.ORG 0X3FF
ISR: 	BRN NOTE
