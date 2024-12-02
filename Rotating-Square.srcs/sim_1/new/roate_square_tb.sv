`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 02:40:35 PM
// Design Name: 
// Module Name: roate_square_tb
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


module roate_square_tb();

    //tb signals 
    logic clk;
    logic reset;
    logic tick;
    
    rotate_square uut(.clk(clk), .reset(reset), .tick(tick));
    
    //clock gen
    initial begin
        clk = 0;
        
        forever #5 clk = ~clk; //10ns clock period  (100 MHz)
    end
    
    //tb logic
    initial begin
        reset = 1;
        
        //apply
        #20;
        reset = 0;
        
        //wait some ticks
        
        #500000000; //0.01 s
        
//        //trigger reset again
//        reset = 1;
//        #20;
//        reset = 0;
        
//        //observe more
//        #500000;
        
        //end
        $finish;
    end
    
    //monitor tick singal
    initial begin
        $monitor("Time: %0t | tick: %0b", $time, tick);
    end
endmodule
