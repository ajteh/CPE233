.DSEG 
.ORG 0x05

.CSEG
.ORG 0x20
MOV R2,0x00
MOV R3,0x00 ;count
MOV R4,0xFF ; current register
INPUT:
	
	IN R1,0x9A
	
	CMP R1,0xFF
	
	BRCC GOTHROUGH
	ADD R3,0x01
	PUSH R1
	
	BRN INPUT

	
GOTHROUGH: LD R1,(R4)
		   SUB R4,0x01
		   CLC
		   CMP R3,0x00
		   BREQ OUTPUT
		   SUB R3,0x01
		   BRN OUTPUT
		   
OUTPUT: OUT R1,0x42
		CMP R3,0x00
		BRNE GOTHROUGH
		
		
