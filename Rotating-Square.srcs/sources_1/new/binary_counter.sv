`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 11:04:52 PM
// Design Name: 
// Module Name: binary_counter
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


module binary_counter(
    input logic clk, reset,
    output logic tick,
    output logic tick_r
);

    //declaration
    localparam DVSR = 5000000;
    logic[22:0] ms_reg, ms_next;
    logic[3:0] d0_reg, d1_reg;
    logic[3:0] d0_next, d1_next;
    logic tick_reg, tick_next;
    logic ms_tick;




    /*==[ BODY ]==*/
    //register
    always_ff @(posedge clk, posedge reset) begin
        if(reset) begin
            ms_reg <= 0;
            d0_reg <= 0;
            d1_reg <= 0;
            tick_reg <= 0;
        end
        else begin
            ms_reg <= ms_next;
            d0_reg <= d0_next;
            d1_reg <= d1_next;
            tick_reg <= tick_next;
        end
    end

    //Next-State Logic
    //0.1 Sec Tick generator
    assign ms_next = (ms_reg == DVSR) ? 23'b0 : ms_reg + 1;
    assign ms_tick = (ms_reg == DVSR) ? 1'b1 : 1'b0;

    //3 digit bcd counter
    always_comb begin
        d0_next = d0_reg;
        d1_next = d1_reg;
        tick_next = tick_reg;

        if(ms_tick) begin
            if(d0_reg != 9) begin
                d0_next = d0_reg + 1;
            end
            else begin
                d0_next = 4'b0;

                if(d1_reg != 9) begin
                    d1_next = d1_reg + 1;
                end
                else begin
                    d1_next = 4'b0;

                    tick_next = 1'b1;
                end
            end
        end
    end

    assign tick = tick_reg;
    assign tick_r = ~tick_reg;
endmodule
