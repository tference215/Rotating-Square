`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 10:49:37 PM
// Design Name: 
// Module Name: rotate-square
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


module rotate_square(
        input logic clk, reset,
        output logic tick,
        output logic tick_r
    );
    
   
   binary_counter counter(.clk(clk), .reset(reset), .tick(tick), .tick_r(tick_r));                                           
endmodule
