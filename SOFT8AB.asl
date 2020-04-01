

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


(0001)                       154  || .EQU IN_PORT = 0x9A
(0002)                       064  || .EQU LEDS = 0x40
(0003)                       154  || .EQU SWITCHES = 0x9A
(0004)                            || 
(0005)                            || 
(0006)                            || .CSEG
(0007)                       001  || .ORG 0x01                
(0008)                            || 
(0009)                            || 
(0010)  CS-0x001  0x36A00         || MOV R10,0x00
(0011)  CS-0x002  0x1A000         || SEI ; enable interrupts
(0012)                     0x003  || MAIN: 
(0013)                            || 	  
(0014)  CS-0x003  0x08018         || 	  BRN MAIN
(0015)                            ||    
(0016)  CS-0x004  0x3299A  0x004  || ISR: IN R9,SWITCHES  ; takes in input from switches
(0017)  CS-0x005  0x00A4A         || 	 EXOR R10,R9  ; holds the previous value or current value???????
(0018)  CS-0x006  0x34A40         ||      OUT R10,LEDS
(0019)  CS-0x007  0x1A003         || 	 RETIE    ; goes back in
(0020)                            || 	  
(0021)                       1023  || .ORG 0x3FF
(0022)  CS-0x3FF  0x08020         || BRN ISR
(0023)                            || 		 
(0024)                            || 		
(0025)                            || 
(0026)                            || 	   
(0027)                            || 					
(0028)                            || 	   





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
ISR            0x004   (0016)  ||  0022 
MAIN           0x003   (0012)  ||  0014 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0001)  ||  
LEDS           0x040   (0002)  ||  0018 
SWITCHES       0x09A   (0003)  ||  0016 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
