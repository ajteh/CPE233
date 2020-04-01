.CSEG
.ORG 0x01
BRN MAIN

ADD_REG: SUB R2,0x01
		 ADD R1,R3
		 
		 
		 BRCC SKIP
		 ADD R4,0x01
SKIP: 	CMP R2,0x00
		RET
		BRN ADD_REG 
		 

			
		
		 

		 
		
		
MAIN: MOV R1,0x00
	  MOV R2,0x00
	  IN R1,0x9A
	  CMP R1,0x00
	  BREQ OUTPUT_DONE
	  IN R2,0x9A   ; next input
	  CMP R1,0x00
	  BREQ OUTPUT_DONE
	  
	  
	  ; mult part
	  MOV R3,R2; takes in the counting number from reg 2 (the second number)
	  MOV R4, 0x00; count for the top numbers
	  CALL ADD_REG
OUTPUT_DONE: OUT R4,0x41
		     OUT R1,0x42
