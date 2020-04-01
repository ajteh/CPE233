.CSEG
.ORG 0x01

		 
		
		
MAIN: MOV R1,0x00; R1 gonna get screwed
	  MOV R2,0x00
	  IN R1,0x9A   ; takes in value

	  CMP R1,0x00   ; if 0x00 just jump to output
	  BREQ ZERO
	  IN R2,0x9A   ; next input
	  CMP R2,0x00   ; jumps to output if 0x00
	  BREQ ZERO
	  
	  
	 MOV R3,R1; takes in the counting number from reg 2 (the second number)
	  MOV R4, 0x00; count for the top 8-bits 
	  
	  SUB R2,0x01  ; subtract because if by itself 
	  CALL ADD_REG
	  

	  
	  
OUTPUT_DONE: OUT R4,0x41
		     OUT R1,0x42
			 END: BRN END

ZERO:	MOV R4,0X00
		MOV R1,0X00
		BRN OUTPUT_DONE			 
			 
ADD_REG:
		 CMP R2,0x00 
		 BREQ GO2
		 SUB R2,0x01
		 ADD R1,R3
		 
		
		BRCC SKIP
		ADD R4,0x01
		SKIP: CMP R2,0x00
		BRNE ADD_REG 
		BREQ GO
		
GO: RET
GO2: RET

