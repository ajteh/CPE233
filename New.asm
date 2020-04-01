.CSEG
.ORG 0X01
.EQU KEYBOARD = 0X44       ; output address of keyboard
.EQU LEDS = 0X40           ; output address of LEDS
.EQU SPEAKER = 0X90        ; output address of SPEAKER 


MOV 	R1,48              ; register used for loops for set time for quarter note
MOV		R2,96              ;register used for loops for set time  for half note 
MOV		R3,191             ; register used for loops for set time  for full note
MOV 	R4,255       
MOV 	R5,255
MOV		R6,0               ; declare register used for input
MOV		R7,0               ; register used for second input if recording happens
MOV 	R8,0                
MOV		R9,0	
MOV     R15, 0x00; counter for inserting into scratch
MOV     R16,0x00; counter for outputting scratch
MOV 	R31,0             ; register used to output nothing to speakers 

SEI
MAIN: 	CMP R6, 0x00        ;The main allows regular notes to be played and ensures that the last note of the recording isn't held to infinity  
		BREQ MAIN
		CMP R7,	0x09
		BRCS MAIN
		OUT R6,SPEAKER
		BRN MAIN	
	   
				
LOOP1: 	MOV R4,255
LOOP2:	MOV R5,255


LOOP3:	SUB R5,0X01
		BRNE LOOP3

		SUB R4,0X01
		BRNE LOOP2

		SUB R10,0x01
		BRNE LOOP1
		;MOV R20,0X00
		;OUT R20,SPEAKER
		CMP R16, R15
		BRNE PLAYRECORDING
		MOV R16,0X00
		BREQ RETURN
		
PLAYQUART:  MOV R10,R1                 ;move the R1 value into R10 to use within the loop as counter   for .5 sec
			OUT R26,SPEAKER
			BRN LOOP1
PLAYHALF:   MOV R10,R2					; move the R2 value into R10 to use within the loop as counter for 1 sec
			OUT R26,SPEAKER
		    BRN LOOP1
PLAYFULL:	MOV R10,R3                 ; move the R3 value into R10 to use within the loop as counter for 1.5 sec
			OUT R26,SPEAKER
			BRN LOOP1
			
SET_QUART:	CMP R15,0xFD   ; compare with max before storing, if max reached break out
			BREQ RETURN     ; ifR15 greater than max
			ST R1,(R15)		; store time for note
			
			ADD R15,0x01    ;increase the counter for next load
			BRN STORENOTE
			;MOV R10,R1
			;MOV R31,255
			;OUT R20,LEDS
			;BRN LOOP1
SET_HALF:	CMP  R15,0xFD   ; compare with max before storing, if max reached break out
			BREQ RETURN
			ST R2,(R15)		; store time for note
			ADD R15,0x01  ; increase the counter for next load
			BRN STORENOTE

			;MOV R10,R2
			;MOV R31,0XAA
			;OUT R20,LEDS
			;BRN LOOP1
			
SET_FULL:	CMP  R15,0xFD   ; compare with max before storing, if max reached break out
			BREQ RETURN
			ST R3,(R15)		; store time for note
			ADD R15,0x01    ;increase the counter for next load
			BRN STORENOTE
		
			;MOV R31,0X55
			;OUT R20,LEDS
			;BRN LOOP1

		
STORENOTE: 	IN 	R6,	KEYBOARD          ; whatever the note the user wants to record takes it in and stores it 
			CMP R6,	R7
			BREQ	STORENOTE         ; store the note
			CMP R6,	0x00               ; if zero go back to storing note constantly looking for one
			BREQ 	STORENOTE         
		    ST R6,(R15)
			ADD R15,0x01
			BRN STORERECORDINGHOLD         ; go back to find a hold time
    
		
PLAYRECORDING: 	CMP R15,R16        ; if R15 equals R16, nothing is played, deals with case of no recording or deleting
				BREQ RETURN        ; if that happens go back to main and keep running
				LD R25, (R16) ; get the hold time
				ADD R16,0x01       ; add the scratch output pointer
				LD R26, (R16)     ; store the note
				OUT R26,SPEAKER   ; output the note
				ADD R16,0x01       ; add the scratch output pointer
				CMP R25,0x30       ; compares the hold time with quarter note, if it is then go and play it 
				BREQ PLAYQUART
				CMP R25,0x60    ; compares the hold time with half note, if it is then go and play it 
				BREQ PLAYHALF
				CMP R25,0xBF   ; compares the hold time with full note, if it is then go and play it 
				BREQ PLAYFULL
				CMP R15,R16
				BRNE PLAYRECORDING   ; if it ends after going through scratch ram
;				OUT R31,SPEAKER
;				BRN 	RETURN
			   
			   
STORERECORDINGHOLD: 
		;IN 	R9, KEYBOARD
		MOV R15,0X00
		MOV R16,0X00
		IN	R7,	KEYBOARD         ; there are two inputs needed for storing recording, specifically here for taking in the hold time
		CMP R7,	0X05			; compare the hold time input to F1, if it is then it is a quarternote
		BREQ	SET_QUART
		CMP R7,	0X06             ; compare the hold time input to F2, if it is then it should be stored as a half note
		BREQ	SET_HALF
		CMP R7,	0X04              ; compare the hold time input to F3, if it is then it should be stored as a full note
		BREQ	SET_FULL 
		CMP R7, 0X09             ; if the button pressed isn't a hold button but F10, then that means user wants to stop recording 
		BREQ 	RETURNFROMRECORDING	;STOP RECORDING BEFORE PLAYING 
	    BRN STORERECORDINGHOLD          ; if no input keep looking for one after seeing that user wants to record 

OVERWRITE:							; overwrite SCR allowing the delete recording to occur
		MOV R15,0x00				; if backspace is hit then that means the SCR counters should go back to 0
		MOV R16,0x00
		BRN RETURN                 

INTERRUPT:	IN R6, 	KEYBOARD	;Sets R6 to whatever comes in in the input from the interrupt 
		CMP R6,	0X00
		BREQ	RETURN
		CMP R6,	0X78            ; if the input value is F11 start recording
		BREQ	STORERECORDINGHOLD
		CMP R6, 0X07			; if the input value is F12 play the recording
		BREQ	PLAYRECORDING
		CMP R6, 0x66
		BREQ OVERWRITE            ; if backspace is hit then delete recording
		OUT	R6, SPEAKER				; else this means a normal key is pressed so out to speaker
	
RETURN:	RETIE					; allow to return back to main enabling the interrupts

RETURNFROMRECORDING: 	MOV R6,0X00
						OUT R31, SPEAKER
						RETIE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.ORG 0X3FF
ISR: 	BRN INTERRUPT
