

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


(0001)                            || ; --------------------------------------------------------------------
(0002)                            || ; Program to test keyboard input with interrupts. Each interrupt is 
(0003)                            || ; counted and the current total is displayed to the LEDs (0 - 255)
(0004)                            || ; The keycode is displayed on the Seven Segment
(0005)                            || ;
(0006)                            || ; Author: Paul Hummel
(0007)                            || ; --------------------------------------------------------------------
(0008)                            || 
(0009)                            || .CSEG
(0010)                       016  || .ORG 0X10
(0011)                            || 
(0012)                       129  || .EQU SSEG = 0x81
(0013)                       064  || .EQU LEDS = 0x40
(0014)                       068  || .EQU PS2_KEY_CODE = 0x44
(0015)                       170  || .EQU loop_count = 0xAA
(0016)                            || 
(0017)                     0x010  || init:
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08080  0x100  ||              BRN     0x10        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0018)  CS-0x010  0x1A000         ||    SEI
(0019)  CS-0x011  0x36000         ||    MOV  R0, 0x00    ;r0 used for counting interrupts
(0020)  CS-0x012  0x36100         ||    MOV  R1, 0x00    ;r1 used for reading keyboard code
(0021)  CS-0x013  0x34040         ||    OUT R0, LEDS
(0022)  CS-0x014  0x34181         ||    OUT R1, SSEG
(0023)                            ||    
(0024)  CS-0x015  0x36BAA  0x015  || main:    	MOV R11, loop_count
(0025)                            || 
(0026)  CS-0x016  0x2CB01  0x016  || out_for1:   SUB  R11, 0x01
(0027)  CS-0x017  0x36CAA         ||             MOV  R12, loop_count   ;set middle for loop count
(0028)                            || 
(0029)  CS-0x018  0x2CC01  0x018  || mid_for1:   SUB  R12, 0x01
(0030)  CS-0x019  0x36DAA         ||             MOV  R13, loop_count   ;set inside for loop count
(0031)                            || 
(0032)  CS-0x01A  0x37FFF  0x01A  || in_for1:    MOV  R31, 0xFF
(0033)  CS-0x01B  0x37FFF         ||             MOV  R31, 0xFF
(0034)  CS-0x01C  0x37FFF         ||             MOV  R31, 0xFF
(0035)  CS-0x01D  0x2CD01         ||             SUB  R13, 0x01
(0036)  CS-0x01E  0x080D3         ||             BRNE in_for1
(0037)                            || 
(0038)  CS-0x01F  0x22C00         ||             OR   R12, 0x00         ;load flags for middle for counter
(0039)  CS-0x020  0x080C3         ||             BRNE mid_for1
(0040)                            || 
(0041)  CS-0x021  0x22B00         ||             OR   R11, 0x00         ;load flags for outsde for counter value
(0042)  CS-0x022  0x080B3         ||             BRNE out_for1
(0043)                            ||   
(0044)  CS-0x023  0x080A8         || 			BRN  main   ; continuous loop waiting for interrupts
(0045)                            || 
(0046)                            || 
(0047)                            || ; --------------------------------------------------------------------
(0048)                            || ; Interrupts service routine
(0049)                            || ; --------------------------------------------------------------------
(0050)  CS-0x024  0x32144  0x024  || My_ISR:		IN  R1, PS2_KEY_CODE
(0051)  CS-0x025  0x28001         || 			ADD R0, 0x01
(0052)  CS-0x026  0x34040         || 			OUT R0, LEDS
(0053)  CS-0x027  0x34181         || 			OUT R1, SSEG
(0054)  CS-0x028  0x1A003         || 			RETIE
(0055)                            || 
(0056)                            || ; --------------------------------------------------------------------
(0057)                            || ; interrupt vector
(0058)                            || ; --------------------------------------------------------------------
(0059)                            || .CSEG
(0060)                       1023  || .ORG 0x3FF
(0061)  CS-0x3FF  0x08120         || BRN My_ISR





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
INIT           0x010   (0017)  ||  
IN_FOR1        0x01A   (0032)  ||  0036 
MAIN           0x015   (0024)  ||  0044 
MID_FOR1       0x018   (0029)  ||  0039 
MY_ISR         0x024   (0050)  ||  0061 
OUT_FOR1       0x016   (0026)  ||  0042 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
LEDS           0x040   (0013)  ||  0021 0052 
LOOP_COUNT     0x0AA   (0015)  ||  0024 0027 0030 
PS2_KEY_CODE   0x044   (0014)  ||  0050 
SSEG           0x081   (0012)  ||  0022 0053 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
