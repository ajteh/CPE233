.CSEG
.ORG 0x10

MOV R1,0x00
MOV R2,0x00

IN R1,0x40

MOV R2,0x80
CMP R1,R2
BRCC DIVIDE
BRCS MULT2


DIVIDE: LSR R1	;This function will divide the value by 4
		CLC
		LSR R1
		BRN OUTPUT
		
MULT2:  CLC		;This function will multiply the value by 4
		LSL R1
		BRN OUTPUT
		
OUTPUT: OUT R1,0x42
