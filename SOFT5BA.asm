.DSEG
.ORG 0x05
a: .DB 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

.DEF MIN, R9
.DEF POINTER, R7
.CSEG
.ORG 0X20
MOV R0,0x0A
MOV R2,0X05
MOV R3,0X0A
MOV R4,0x00
INPUT:	IN R1, 0X9A
		ST R1,(R2)
		ADD R2,0X01
		ADD R4,0x01
		CMP R4,R0
		BRCS INPUT

MOV R2,0X00
MOV R4, 0x0A;  counter for inputs
MOV R5, 0x05;   pointer
MOV R6, 0X05;   second pointer
MOV R10,0x00; placement of min

LOOP: LD R7,(R5)
	  LD R8,(R6)
	  LD R9,(R6)  ; min value
	
CHECKTHROUGH:	CLC
				ADD R6,0x01
				CMP R6,0x0F
				BREQ ENTER
				LD R8,(R6)
				BRCS MIN
			
MIN:      CLC
		  CMP R9,R8
		  BRCC PUT
		  BRN CHECKTHROUGH
		  
PUT:	  MOV R9,R8
          MOV R10,R6
          LD R8,(R6)  
		  BRN CHECKTHROUGH  
		  
ENTER:    ST R9,(R5)
		  CMP R10, 0x00
		  BRNE ADDIN
          BRN TRASH
ADDIN:    ST R7,(R10)			 
	
TRASH:	MOV R10,0x00
		OUT R9,0x42
		ADD R5,0x01
		MOV R6,R5
		ADD R2,0x01
		CLC
		CMP R2,R4
		BRCS LOOP
		BRN DONE
DONE: 	OUT R8,0x42
