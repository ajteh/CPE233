.CSEG
.ORG 0X10

MOV R1,0X00
MOV R2,0X00
MOV R3,0X00
IN R1,0X9A
IN R2,0X9A

CMP R2,0x00
BREQ OUTPUT
CMP R1,R2
BRCS OUTPUT
DIV:	SUB R1,R2
		ADD R3,0X01
		CMP R1,R2
		BRCC DIV
		BRCS OUTPUT

OUTPUT: OUT R3,0X42
		OUT R1,0X43
