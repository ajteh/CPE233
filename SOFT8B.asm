.EQU BTNS = 0x9B
.EQU LEDS = 0x40
.EQU SWITCHES = 0x9A


.CSEG
.ORG 0x01                

MOV R0,0x00
MOV R10,0x00
MOV R11,0x00
SEI ; enable interrupts

MAIN: 	CMP R2,0X00
		BREQ MAIN
		IN R1, BTNS
		AND R1, 0x01; take first bit
		CMP R1,0x01; if button is 1
		BREQ REOUT
		BRNE MAIN
		
REOUT:	SEI
		MOV R2,0X00
		OUT R10, LEDS
		BRN MAIN
	 
ADDIN:	MOV R11, R9; holds value		 
		EXOR R10,R9  ; holds the previous value or current value???????
		OUT R10,LEDS
		RETIE
			    
ISR: IN R9,SWITCHES  ; takes in input from switches
     CMP R11,R9
	 BRNE ADDIN
	 MOV R2, 0X01
	 BREQ STOP
	
STOP:
	 OUT R0,LEDS
	 RETID
	 BREQ MAIN

.ORG 0x3FF
BRN ISR
