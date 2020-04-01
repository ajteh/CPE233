.EQU IN_PORT = 0x9A
.EQU LEDS = 0x40
.EQU SWITCHES = 0x9A


.CSEG
.ORG 0x01                


MOV R10,0x00
SEI ; enable interrupts
MAIN: 
	  
	  BRN MAIN
   
ISR: IN R9,SWITCHES  ; takes in input from switches
	 EXOR R10,R9  ; holds the previous value or current value???????
     OUT R10,LEDS
	 RETIE    ; goes back in
	  
.ORG 0x3FF
BRN ISR
		 
		

	   
					
	   
