`timescale 1ns / 1ns

module UdCounter_TB(
    );
    
wire [15:0] LED_TB;
reg  [7:0]  load_TB;
reg  clk_TB,BTNR,BTNU,BTNL,BTND;


 
 // instantiate DUT   Make the parameter width =1 
 // so the count vector is only 2 bits and not 31 for slow clock
   counter8 #1 UD1(
   clk_TB,
   BTNU,
   BTNL,
   BTNR,
   BTND,   
   load_TB,
   LED_TB);

// Clock Generator
    initial begin
    $display ($time, "starting Simulation");
    clk_TB = 1'b0;
    BTNR = 1'b0;
    BTNU = 1'b0;
    BTNL = 1'b0;
    BTND = 1'b0;
    load_TB = 8'b00000000;
    
     //  Test the load and up count
       #10;
       #10;
       load_TB = 8'b10101010;
       BTNL = 1'b1;
       #10;
       #10;
       BTNU = 1'b1;
       #10;
       #10;
       #10;
       #10;
       #10;
       BTNL=1'b0;
       #5
       BTNU = 1'b1;
       #10;
       #10;
       $display ($time, "ending Simulation");
    end
    always  begin
    # 1 clk_TB = ~ clk_TB;
    end
    
          
endmodule   
