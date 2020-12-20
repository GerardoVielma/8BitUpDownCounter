# 8BitUpDownCounter
Board: Xilinx NEXYS4 DDR 

Program Description: 
This verilog module is an 8 bit up/down counter with parallel outs and load, similar to the function
                     of a 74HC190 IC. LEDs[7:0] are the counter ouputs while LEDs[15:8] are the parallel load data. 
                     Push buttons will be used to cause up count PB up (BTNU) with the clock, down count (BTND) with the clock,
                     parallel load (BTNL) with clock and reset with the push button (BTNR).  
