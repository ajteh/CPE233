## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK]							
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]
 
### Switches
set_property PACKAGE_PIN V17 [get_ports {SWITCHES[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[0]}]
set_property PACKAGE_PIN V16 [get_ports {SWITCHES[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[1]}]
set_property PACKAGE_PIN W16 [get_ports {SWITCHES[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[2]}]
set_property PACKAGE_PIN W17 [get_ports {SWITCHES[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[3]}]
set_property PACKAGE_PIN W15 [get_ports {SWITCHES[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[4]}]
set_property PACKAGE_PIN V15 [get_ports {SWITCHES[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[5]}]
set_property PACKAGE_PIN W14 [get_ports {SWITCHES[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[6]}]
set_property PACKAGE_PIN W13 [get_ports {SWITCHES[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SWITCHES[7]}]
#set_property PACKAGE_PIN V2 [get_ports {sw[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PACKAGE_PIN R3 [get_ports {sw[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
#set_property PACKAGE_PIN T1 [get_ports {sw[14]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property PACKAGE_PIN R2 [get_ports {demo}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {demo}]
 

## LEDs
set_property PACKAGE_PIN U16 [get_ports {LEDS[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[0]}]
set_property PACKAGE_PIN E19 [get_ports {LEDS[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[1]}]
set_property PACKAGE_PIN U19 [get_ports {LEDS[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[2]}]
set_property PACKAGE_PIN V19 [get_ports {LEDS[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[3]}]
set_property PACKAGE_PIN W18 [get_ports {LEDS[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[4]}]
set_property PACKAGE_PIN U15 [get_ports {LEDS[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[5]}]
set_property PACKAGE_PIN U14 [get_ports {LEDS[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[6]}]
set_property PACKAGE_PIN V14 [get_ports {LEDS[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[7]}]
#set_property PACKAGE_PIN V13 [get_ports {led[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
#set_property PACKAGE_PIN V3 [get_ports {led[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
#set_property PACKAGE_PIN W3 [get_ports {led[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
#set_property PACKAGE_PIN U3 [get_ports {led[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
#set_property PACKAGE_PIN P3 [get_ports {led[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
#set_property PACKAGE_PIN N3 [get_ports {led[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
#set_property PACKAGE_PIN P1 [get_ports {led[14]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
#set_property PACKAGE_PIN L1 [get_ports {led[15]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]
	
##7 segment display
    set_property PACKAGE_PIN W7 [get_ports {CATHODES[6]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {CATHODES[6]}]
    set_property PACKAGE_PIN W6 [get_ports {CATHODES[5]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {CATHODES[5]}]
    set_property PACKAGE_PIN U8 [get_ports {CATHODES[4]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {CATHODES[4]}]
    set_property PACKAGE_PIN V8 [get_ports {CATHODES[3]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {CATHODES[3]}]
    set_property PACKAGE_PIN U5 [get_ports {CATHODES[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {CATHODES[2]}]
    set_property PACKAGE_PIN V5 [get_ports {CATHODES[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {CATHODES[1]}]
    set_property PACKAGE_PIN U7 [get_ports {CATHODES[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {CATHODES[0]}]
    
    set_property PACKAGE_PIN V7 [get_ports {CATHODES[7]}]                            
        set_property IOSTANDARD LVCMOS33 [get_ports {CATHODES[7]}]
    
    set_property PACKAGE_PIN U2 [get_ports {ANODES[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {ANODES[0]}]
    set_property PACKAGE_PIN U4 [get_ports {ANODES[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {ANODES[1]}]
    set_property PACKAGE_PIN V4 [get_ports {ANODES[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {ANODES[2]}]
    set_property PACKAGE_PIN W4 [get_ports {ANODES[3]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {ANODES[3]}]
    
    
    ##Buttons
    set_property PACKAGE_PIN U18 [get_ports {BTNC}]                        
        set_property IOSTANDARD LVCMOS33 [get_ports {BTNC}]
#    #set_property PACKAGE_PIN T18 [get_ports {Sub}]                        
#    #    set_property IOSTANDARD LVCMOS33 [get_ports {Sub}]
    set_property PACKAGE_PIN W19 [get_ports {BTNL}]                        
        set_property IOSTANDARD LVCMOS33 [get_ports {BTNL}]
    #set_property PACKAGE_PIN T17 [get_ports {clr}]                        
    #    set_property IOSTANDARD LVCMOS33 [get_ports {clr}]
    #set_property PACKAGE_PIN U17 [get_ports {}]                        
        #set_property IOSTANDARD LVCMOS33 [get_ports {}] 
     
     
    
    ##Pmod Header JA
    #Sch name = JA1
    set_property PACKAGE_PIN J1 [get_ports {SPEAKER}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {SPEAKER}]
#    #Sch name = JA2
#    set_property PACKAGE_PIN L2 [get_ports {COLS[1]}]                    
#        set_property IOSTANDARD LVCMOS33 [get_ports {COLS[1]}]
#    #Sch name = JA3
#    set_property PACKAGE_PIN J2 [get_ports {COLS[0]}]                    
#        set_property IOSTANDARD LVCMOS33 [get_ports {COLS[0]}]
    #Sch name = JA4
#    set_property PACKAGE_PIN G2 [get_ports {sine_out}]                    
#        set_property IOSTANDARD LVCMOS33 [get_ports {sine_out}]
#    #Sch name = JA7
#    set_property PACKAGE_PIN H1 [get_ports {G}]                    
#        set_property IOSTANDARD LVCMOS33 [get_ports {G}] 
#    #Sch name = JA8
#    set_property PACKAGE_PIN K2 [get_ports {F}]                    
#        set_property IOSTANDARD LVCMOS33 [get_ports {F}]
#    #Sch name = JA9
#    set_property PACKAGE_PIN H2 [get_ports {D}]                    
#        set_property IOSTANDARD LVCMOS33 [get_ports {D}]
    
#    #Sch name = JA10
    set_property PACKAGE_PIN G3 [get_ports {TEST}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {TEST}]
    
##USB HID (PS/2)
set_property PACKAGE_PIN C17 [get_ports PS2CLK]
set_property IOSTANDARD LVCMOS33 [get_ports PS2CLK]
set_property PULLUP true [get_ports PS2CLK]
set_property PACKAGE_PIN B17 [get_ports PS2DATA]
set_property IOSTANDARD LVCMOS33 [get_ports PS2DATA]
set_property PULLUP true [get_ports PS2DATA]
