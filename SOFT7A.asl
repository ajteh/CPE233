

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || .CSEG
(0002)                       016  || .ORG 0X10
(0003)                     0x010  || MAIN: 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08080  0x100  ||              BRN     0x10        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0004)  CS-0x010  0x36100         || 	MOV R1,0X00 ;  remainder for 10
(0005)  CS-0x011  0x36600         || 	MOV R6,0x00; counter 
(0006)  CS-0x012  0x36300         || 	MOV R3,0X00  ; count for 10
(0007)  CS-0x013  0x36500         || 	MOV R5,0x00   ; 
(0008)  CS-0x014  0x3239A         || 	IN R3,0x9A   ; takes in the value
(0009)                            || 
(0010)  CS-0x015  0x3620A         || 	MOV R2,0X0A ; divide number for 10
(0011)  CS-0x016  0x36464         || 	MOV R4,0x64; divide number for 100
(0012)  CS-0x017  0x08149         || 	CALL DIVBY100
(0013)  CS-0x018  0x04119         || 	MOV R1,R3;    takes in the remainder 
(0014)  CS-0x019  0x04331         || 	MOV R3, R6    ; R3 gets the quotient of 100’s place 
(0015)  CS-0x01A  0x36500         || 	MOV R5,0x00   
(0016)  CS-0x01B  0x08111         || 	CALL DIVBY10
(0017)  CS-0x01C  0x04809         || 	MOV R8,R1    ;takes the remainder (one place)
(0018)  CS-0x01D  0x04129         || 	MOV R1,R5    ; takes the quotient of 10s 
(0019)                            || 	;OUT R3,0x03
(0020)                            || 
(0021)  CS-0x01E  0x34341         || 	OUT R3, 0x41  ; 100s
(0022)  CS-0x01F  0x34142         || 	OUT R1, 0x42  ; 10s
(0023)  CS-0x020  0x34843         || 	OUT R8,0x43   ; ones place
(0024)  CS-0x021  0x08108  0x021  || END: BRN END	
(0025)                            || 
(0026)  CS-0x022  0x04110  0x022  || DIVBY10:   CMP R1, R2    ; cmp with 10
(0027)  CS-0x023  0x0A180         || 		BRCS UNDER	   ; if less than 10 just jump back
(0028)  CS-0x024  0x02112         || 		SUB R1,R2     ; “divide”
(0029)  CS-0x025  0x28501         || 		ADD R5,0X01  ; add 1 show how many times it can divide
(0030)  CS-0x026  0x04110         || 		CMP R1,R2    ; compare to see if under the divisor
(0031)  CS-0x027  0x0A111         || 		BRCC DIVBY10   ; if not does it again
(0032)                            || 		
(0033)                            || 		
(0034)  CS-0x028  0x18002         || 		RET            ; else return back
(0035)                            || 		
(0036)                            || 
(0037)                            || 	
(0038)  CS-0x029  0x04320  0x029  || DIVBY100:  CMP R3, R4   ; cmp with 100
(0039)  CS-0x02A  0x0A180         || 		BRCS UNDER
(0040)  CS-0x02B  0x02322         || 		SUB R3,R4    ; “divide”
(0041)  CS-0x02C  0x28601         || 		ADD R6,0X01  ; adds 1 show how many times it can divide 
(0042)  CS-0x02D  0x04320         || 		CMP R3,R4    ; compare to see if under the divisor
(0043)  CS-0x02E  0x0A149         || 		BRCC DIVBY100  ; if not does it again
(0044)  CS-0x02F  0x18002         || 		RET            ; else return back
(0045)                            || 		
(0046)                            || 		
(0047)                            || 
(0048)  CS-0x030  0x18002  0x030  || UNDER:   RET         ; if a underflow happens jump back to maincode
(0049)                            || 
(0050)                            || 





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
DIVBY10        0x022   (0026)  ||  0016 0031 
DIVBY100       0x029   (0038)  ||  0012 0043 
END            0x021   (0024)  ||  0024 
MAIN           0x010   (0003)  ||  
UNDER          0x030   (0048)  ||  0027 0039 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
--> No ".EQU" directives used


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
