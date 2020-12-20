`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: 8 Bit Up/Down Counter
//////////////////////////////////////////////////////////////////////////////////

//when we instantiate this module put counter8 # 1 to change width to 1 thus changing size im slow clk
module counter8(clk,btnU,btnL,btnR,btnD,sw,led);
    input clk;
    input btnU;
    input btnL;
    input btnR;
    input btnD;
    input [15:8] sw;
    output [15:0] led;
    //make the parameter width 1 when we instantiate it.
    parameter width = 100000000; 

   reg [7:0] Count_Reg; 

   assign led = {sw[15:8],Count_Reg};   
   slow_clock # width IN1 (clk, clk_Slow);
   
   initial
   begin
   Count_Reg = 8'b00000000;
   end
   
   always @(posedge clk_Slow)  begin
   
// When pushing up button(btnu), want to increase the count value (Count_Reg)
// since it's 8 bit just do Count reg plus 1
// Down button subtract one count reg minus 1
// On clear btn count reg equal to zero. (btnr)
// loud button btnl. get "sw[15:8]" set Count reg equal to switches

    if (btnR) begin 
    Count_Reg = 0;
    end
    else if (btnL) begin
    Count_Reg = sw;
    end
    else if (btnU) begin
    Count_Reg = Count_Reg + 1;
    end
    else if (btnD) begin
    Count_Reg = Count_Reg - 1;
        end    
    end
    assign led[15:8] = sw;
    assign led[7:0] = Count_Reg;
endmodule

// This module slows down the 100 Mhz clock to a 2 second period.

module slow_clock(Clk, Clk_Slow);
parameter size = 100000000;  //added to be used by test bench 
input Clk;
output Clk_Slow;
reg [31:0] counter_out;
reg Clk_Slow;
	initial begin	//Note this will synthesize because we are using an FPGA and not making an IC
	counter_out<= 32'h00000000;
	Clk_Slow <=0;
	end
	
//this always block runs on the fast 100MHz clock
always @(posedge Clk) begin
	counter_out<=    counter_out + 32'h00000001;
		
	if (counter_out  > size) begin
		counter_out<= 32'h00000000;
		Clk_Slow <= !Clk_Slow;
		end
	end

endmodule
