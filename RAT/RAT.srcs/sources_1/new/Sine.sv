`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2019 12:42:44 AM
// Design Name: 
// Module Name: Sine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
package math_pkg;

  //import dpi task      C Name = SV function name
  import "DPI-C" pure function real sin (input real rTheta);

endpackage : math_pkg

module Sine(input CLK, output real sine_out);

  import math_pkg::*;
  parameter  sampling_time = 5;
  const real pi = 3.1416;
  real       time_us, time_s ;
  bit        sampling_clock;

  real       offset = 2.5;

  real       ampl = 2.5;

 

  always sampling_clock = #(sampling_time) ~sampling_clock;

 

  always @(sampling_clock) begin

    time_us = $time/1000;

    time_s = time_us/1000000;

  end

  assign sine_out = offset + (ampl * sin(2*pi*CLK*time_s));

endmodule
