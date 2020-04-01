.CSEG
.ORG 0X10
MAIN: 
	MOV R1,0X00 ;  remainder for 10
	MOV R6,0x00; counter 
	MOV R3,0X00  ; count for 10
	MOV R5,0x00   ; 
	IN R3,0x9A   ; takes in the value

	MOV R2,0X0A ; divide number for 10
	MOV R4,0x64; divide number for 100
	CALL DIVBY100
	MOV R1,R3;    takes in the remainder 
	MOV R3, R6    ; R3 gets the quotient of 100’s place 
	MOV R5,0x00   
	CALL DIVBY10
	MOV R8,R1    ;takes the remainder (one place)
	MOV R1,R5    ; takes the quotient of 10s 
	;OUT R3,0x03

	OUT R3, 0x41  ; 100s
	OUT R1, 0x42  ; 10s
	OUT R8,0x43   ; ones place
END: BRN END	

DIVBY10:   CMP R1, R2    ; cmp with 10
		BRCS UNDER	   ; if less than 10 just jump back
		SUB R1,R2     ; “divide”
		ADD R5,0X01  ; add 1 show how many times it can divide
		CMP R1,R2    ; compare to see if under the divisor
		BRCC DIVBY10   ; if not does it again
		
		
		RET            ; else return back
		

	
DIVBY100:  CMP R3, R4   ; cmp with 100
		BRCS UNDER
		SUB R3,R4    ; “divide”
		ADD R6,0X01  ; adds 1 show how many times it can divide 
		CMP R3,R4    ; compare to see if under the divisor
		BRCC DIVBY100  ; if not does it again
		RET            ; else return back
		
		

UNDER:   RET         ; if a underflow happens jump back to maincode


